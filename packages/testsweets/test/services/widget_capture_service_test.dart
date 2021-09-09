import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:testsweets/src/locator.dart';
import 'package:testsweets/src/models/application_models.dart';
import 'package:testsweets/src/models/enums/widget_type.dart';
import 'package:testsweets/src/services/widget_capture_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('WidgetCaptureServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('loadWidgetDescriptions -', () {
      test(
          'When called, should get all the widget descriptions from the CloudFunctionsService',
          () async {
        final cloudFunctionsService = getAndRegisterCloudFunctionsService();
        final service = WidgetCaptureService();
        await service.loadWidgetDescriptionsForProject(projectId: 'proj');
        verify(cloudFunctionsService.getWidgetDescriptionForProject(
          projectId: 'proj',
        ));
      });

      test(
          'When called and descriptions are returned with 1 description for login and 1 for sign up, should populat map with key login and signup',
          () async {
        getAndRegisterCloudFunctionsService(
            getWidgetDescriptionForProjectResult: [
              WidgetDescription(
                viewName: 'login',
                name: 'loginButton',
                widgetType: WidgetType.touchable,
                position: WidgetPosition(x: 0, y: 0),
              ),
              WidgetDescription(
                viewName: 'signUp',
                name: 'loginButton',
                widgetType: WidgetType.touchable,
                position: WidgetPosition(x: 0, y: 0),
              ),
            ]);
        final service = WidgetCaptureService();
        await service.loadWidgetDescriptionsForProject(projectId: 'proj');

        expect(service.widgetDescriptionMap.containsKey('login'), true);
        expect(service.widgetDescriptionMap.containsKey('signUp'), true);
      });

      test(
          'When called and descriptions are returned with 2 descriptions for login, should have 2 in login key',
          () async {
        getAndRegisterCloudFunctionsService(
            getWidgetDescriptionForProjectResult: [
              WidgetDescription(
                viewName: 'login',
                name: 'loginButton',
                widgetType: WidgetType.touchable,
                position: WidgetPosition(x: 0, y: 0),
              ),
              WidgetDescription(
                viewName: 'login',
                name: 'loginButton2',
                widgetType: WidgetType.touchable,
                position: WidgetPosition(x: 0, y: 0),
              ),
            ]);
        final service = WidgetCaptureService();
        await service.loadWidgetDescriptionsForProject(projectId: 'proj');

        expect(service.widgetDescriptionMap['login']?.length, 2);
      });
    });

    group('captureWidgetDescription -', () {
      test(
          'When called, should capture the widget description passed in to the backed',
          () async {
        final description = WidgetDescription(
          viewName: 'login',
          name: 'email',
          position: WidgetPosition(x: 100, y: 199),
          widgetType: WidgetType.general,
        );

        final cloudFunctionsService = getAndRegisterCloudFunctionsService();
        getAndRegisterTestSweetsConfigFileService(
          valueFromConfigFileByKey: 'projectId',
        );

        final service = WidgetCaptureService();
        await service.captureWidgetDescription(
            description: description, projectId: 'proj');

        verify(cloudFunctionsService.uploadWidgetDescriptionToProject(
          projectId: 'projectId',
          description: description,
        ));
      });

      test(
          'When widget has been added to backend, add description to descriptionMap with id from the backend',
          () async {
        final description = WidgetDescription(
          viewName: 'login',
          name: 'email',
          position: WidgetPosition(x: 100, y: 199),
          widgetType: WidgetType.general,
        );

        final String idToReturn = 'cloud_id';

        getAndRegisterCloudFunctionsService(
            addWidgetDescritpionToProjectResult: idToReturn);

        final service = WidgetCaptureService();
        await service.captureWidgetDescription(
            description: description, projectId: 'prodj');

        expect(
          service.widgetDescriptionMap[description.viewName]?.first.id,
          idToReturn,
        );
      });
    });
  });
}