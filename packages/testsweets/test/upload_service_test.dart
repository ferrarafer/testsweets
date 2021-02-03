import 'dart:io';
import 'dart:typed_data';

import 'package:test/test.dart';

import 'helpers.dart';
import 'package:mockito/mockito.dart';
import '../bin/src/locator.dart';
import '../bin/src/services/file_system_service.dart';
import '../bin/src/services/upload_service.dart';
import '../bin/src/services/http_service.dart';
import '../bin/src/models/build_info.dart';
import '../bin/src/services/time_service.dart';
import '../bin/src/services/cloud_functions_service.dart';

void main() {
  setUp(setUpLocatorForTesting);
  tearDown(() {
    locator.reset();
  });

  group("UploadService Tests", () {
    group("uploadBuild(buildInfo, projectId, apiKey)", () {
      final buildInfo = BuildInfo(
          pathToBuild: 'abc.apk',
          buildMode: 'debug',
          appType: 'apk',
          version: '1.2.0');

      final projectId = 'testProjectId';
      final apiKey = 'testApiKey';
      final dummySignedUrl =
          'https://storage.googleapis.com/testProjectId/testGuid%2fapplication.build';

      final expectedObjectHeaders = <String, String>{
        HttpHeaders.contentLengthHeader: '2',
        HttpHeaders.contentTypeHeader: 'application/octet-stream',
        'Host': 'storage.googleapis.com',
        'Date': "Wed, 03 Feb 2021 13:47:14 GMT",
        'x-goog-meta-buildMode': 'debug',
        'x-goog-meta-version': '1.2.0',
        'x-goog-meta-appType': 'apk',
      };

      final buildFileContents = Uint8List.fromList([0xaa, 0xbb]);

      setUp(() {
        final cloudFunctionsService = locator<CloudFunctionsService>();
        when(cloudFunctionsService.getV4BuildUploadSignedUrl(projectId, apiKey))
            .thenAnswer((_) async => dummySignedUrl);

        final fileSystemService = locator<FileSystemService>();
        when(fileSystemService.doesFileExist('abc.apk')).thenReturn(true);
        when(fileSystemService.readFileAsBytesSync('abc.apk'))
            .thenReturn(buildFileContents);

        final httpService = locator<HttpService>();
        when(httpService.putBinary(
          to: dummySignedUrl,
          data: buildFileContents,
          headers: expectedObjectHeaders,
        )).thenAnswer((_) async => SimpleHttpResponse(200, ''));

        final timeService = locator<TimeService>();
        when(timeService.now())
            .thenReturn(DateTime.parse("20210203T134714Z")); // ISO 8601
      });
      test(
          "Should upload the file with the correct data and headers to the signed endpoint returned by CloudFunctionsService.getV4BuildUploadSignedUrl",
          () async {
        final instance = UploadService.makeInstance();

        await instance.uploadBuild(buildInfo, projectId, apiKey);

        final httpService = locator<HttpService>();
        verify(httpService.putBinary(
                to: dummySignedUrl,
                data: buildFileContents,
                headers: expectedObjectHeaders))
            .called(1);
      });
    });
  });
}