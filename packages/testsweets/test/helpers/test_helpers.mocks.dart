// Mocks generated by Mockito 5.0.17 from annotations
// in testsweets/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:ui' as _i11;

import 'package:flutter/material.dart' as _i7;
import 'package:logger/src/logger.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/src/snackbar/snackbar_config.dart' as _i6;
import 'package:stacked_services/src/snackbar/snackbar_service.dart' as _i5;
import 'package:testsweets/src/models/application_models.dart' as _i9;
import 'package:testsweets/src/services/cloud_functions_service.dart' as _i12;
import 'package:testsweets/src/services/http_service.dart' as _i3;
import 'package:testsweets/src/services/sweetcore_command.dart' as _i14;
import 'package:testsweets/src/services/testsweets_route_tracker.dart' as _i10;
import 'package:testsweets/src/services/widget_capture_service.dart' as _i8;
import 'package:testsweets/src/services/widget_visibilty_changer_service.dart'
    as _i13;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeLogger_0 extends _i1.Fake implements _i2.Logger {}

class _FakeHttpService_1 extends _i1.Fake implements _i3.HttpService {}

class _FakeCompleter_2<T> extends _i1.Fake implements _i4.Completer<T> {}

/// A class which mocks [SnackbarService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackbarService extends _i1.Mock implements _i5.SnackbarService {
  @override
  void registerSnackbarConfig(_i6.SnackbarConfig? config) =>
      super.noSuchMethod(Invocation.method(#registerSnackbarConfig, [config]),
          returnValueForMissingStub: null);
  @override
  void registerCustomSnackbarconfig(
          {dynamic customData, _i6.SnackbarConfig? config}) =>
      super.noSuchMethod(
          Invocation.method(#registerCustomSnackbarconfig, [],
              {#customData: customData, #config: config}),
          returnValueForMissingStub: null);
  @override
  void registerCustomMainButtonBuilder(
          {dynamic variant,
          _i7.Widget Function(String?, Function?)? builder}) =>
      super.noSuchMethod(
          Invocation.method(#registerCustomMainButtonBuilder, [],
              {#variant: variant, #builder: builder}),
          returnValueForMissingStub: null);
  @override
  void registerCustomSnackbarConfig(
          {dynamic variant,
          _i6.SnackbarConfig? config,
          _i6.SnackbarConfig Function()? configBuilder}) =>
      super.noSuchMethod(
          Invocation.method(#registerCustomSnackbarConfig, [], {
            #variant: variant,
            #config: config,
            #configBuilder: configBuilder
          }),
          returnValueForMissingStub: null);
  @override
  void showSnackbar(
          {String? title = r'',
          String? message,
          dynamic Function(dynamic)? onTap,
          Duration? duration = const Duration(seconds: 3),
          String? mainButtonTitle,
          void Function()? onMainButtonTapped}) =>
      super.noSuchMethod(
          Invocation.method(#showSnackbar, [], {
            #title: title,
            #message: message,
            #onTap: onTap,
            #duration: duration,
            #mainButtonTitle: mainButtonTitle,
            #onMainButtonTapped: onMainButtonTapped
          }),
          returnValueForMissingStub: null);
  @override
  _i4.Future<dynamic>? showCustomSnackBar(
          {String? message,
          dynamic customData,
          dynamic variant,
          String? title,
          String? mainButtonTitle,
          void Function()? onMainButtonTapped,
          Function? onTap,
          Duration? duration = const Duration(seconds: 1)}) =>
      (super.noSuchMethod(Invocation.method(#showCustomSnackBar, [], {
        #message: message,
        #customData: customData,
        #variant: variant,
        #title: title,
        #mainButtonTitle: mainButtonTitle,
        #onMainButtonTapped: onMainButtonTapped,
        #onTap: onTap,
        #duration: duration
      })) as _i4.Future<dynamic>?);
}

/// A class which mocks [WidgetCaptureService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWidgetCaptureService extends _i1.Mock
    implements _i8.WidgetCaptureService {
  @override
  _i2.Logger get log =>
      (super.noSuchMethod(Invocation.getter(#log), returnValue: _FakeLogger_0())
          as _i2.Logger);
  @override
  Map<String, List<_i9.WidgetDescription>> get widgetDescriptionMap =>
      (super.noSuchMethod(Invocation.getter(#widgetDescriptionMap),
              returnValue: <String, List<_i9.WidgetDescription>>{})
          as Map<String, List<_i9.WidgetDescription>>);
  @override
  bool get verbose =>
      (super.noSuchMethod(Invocation.getter(#verbose), returnValue: false)
          as bool);
  @override
  set projectId(String? projectId) =>
      super.noSuchMethod(Invocation.setter(#projectId, projectId),
          returnValueForMissingStub: null);
  @override
  set addWidgetDescriptionToMap(_i9.WidgetDescription? description) => super
      .noSuchMethod(Invocation.setter(#addWidgetDescriptionToMap, description),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> loadWidgetDescriptionsForProject() => (super.noSuchMethod(
      Invocation.method(#loadWidgetDescriptionsForProject, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  List<_i9.WidgetDescription> getDescriptionsForView({String? currentRoute}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getDescriptionsForView, [], {#currentRoute: currentRoute}),
              returnValue: <_i9.WidgetDescription>[])
          as List<_i9.WidgetDescription>);
  @override
  bool checkCurrentViewIfAlreadyCaptured(String? originalViewName) =>
      (super.noSuchMethod(
          Invocation.method(
              #checkCurrentViewIfAlreadyCaptured, [originalViewName]),
          returnValue: false) as bool);
  @override
  _i4.Future<String?> captureWidgetDescription(
          {_i9.WidgetDescription? description}) =>
      (super.noSuchMethod(
          Invocation.method(
              #captureWidgetDescription, [], {#description: description}),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
  @override
  _i4.Future<String?> updateWidgetDescription(
          {_i9.WidgetDescription? description}) =>
      (super.noSuchMethod(
          Invocation.method(
              #updateWidgetDescription, [], {#description: description}),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
  @override
  _i4.Future<String?> deleteWidgetDescription(
          {_i9.WidgetDescription? description}) =>
      (super.noSuchMethod(
          Invocation.method(
              #deleteWidgetDescription, [], {#description: description}),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
}

/// A class which mocks [TestSweetsRouteTracker].
///
/// See the documentation for Mockito's code generation for more information.
class MockTestSweetsRouteTracker extends _i1.Mock
    implements _i10.TestSweetsRouteTracker {
  @override
  _i2.Logger get log =>
      (super.noSuchMethod(Invocation.getter(#log), returnValue: _FakeLogger_0())
          as _i2.Logger);
  @override
  bool get testMode =>
      (super.noSuchMethod(Invocation.getter(#testMode), returnValue: false)
          as bool);
  @override
  set testMode(bool? _testMode) =>
      super.noSuchMethod(Invocation.setter(#testMode, _testMode),
          returnValueForMissingStub: null);
  @override
  bool get isChildRouteActivated =>
      (super.noSuchMethod(Invocation.getter(#isChildRouteActivated),
          returnValue: false) as bool);
  @override
  bool get isNestedView =>
      (super.noSuchMethod(Invocation.getter(#isNestedView), returnValue: false)
          as bool);
  @override
  String get currentRoute =>
      (super.noSuchMethod(Invocation.getter(#currentRoute), returnValue: '')
          as String);
  @override
  String get formatedCurrentRoute =>
      (super.noSuchMethod(Invocation.getter(#formatedCurrentRoute),
          returnValue: '') as String);
  @override
  String get parentRoute =>
      (super.noSuchMethod(Invocation.getter(#parentRoute), returnValue: '')
          as String);
  @override
  String get formatedParentRoute =>
      (super.noSuchMethod(Invocation.getter(#formatedParentRoute),
          returnValue: '') as String);
  @override
  String get formatedTempRoute => (super
          .noSuchMethod(Invocation.getter(#formatedTempRoute), returnValue: '')
      as String);
  @override
  String get leftViewName =>
      (super.noSuchMethod(Invocation.getter(#leftViewName), returnValue: '')
          as String);
  @override
  String get rightViewName =>
      (super.noSuchMethod(Invocation.getter(#rightViewName), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void setCurrentRoute(String? route) =>
      super.noSuchMethod(Invocation.method(#setCurrentRoute, [route]),
          returnValueForMissingStub: null);
  @override
  void setparentRoute(String? route) =>
      super.noSuchMethod(Invocation.method(#setparentRoute, [route]),
          returnValueForMissingStub: null);
  @override
  void toggleActivatedRouteBetweenParentAndChild() => super.noSuchMethod(
      Invocation.method(#toggleActivatedRouteBetweenParentAndChild, []),
      returnValueForMissingStub: null);
  @override
  void refreshUi() => super.noSuchMethod(Invocation.method(#refreshUi, []),
      returnValueForMissingStub: null);
  @override
  void addListener(_i11.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i11.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [CloudFunctionsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCloudFunctionsService extends _i1.Mock
    implements _i12.CloudFunctionsService {
  @override
  _i2.Logger get log =>
      (super.noSuchMethod(Invocation.getter(#log), returnValue: _FakeLogger_0())
          as _i2.Logger);
  @override
  _i3.HttpService get httpService =>
      (super.noSuchMethod(Invocation.getter(#httpService),
          returnValue: _FakeHttpService_1()) as _i3.HttpService);
  @override
  _i4.Future<String> getV4BuildUploadSignedUrl(
          String? projectId, String? apiKey,
          [Map<dynamic, dynamic>? extensionHeaders = const {}]) =>
      (super.noSuchMethod(
          Invocation.method(#getV4BuildUploadSignedUrl,
              [projectId, apiKey, extensionHeaders]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<bool> doesBuildExistInProject(String? projectId,
          {String? withVersion}) =>
      (super.noSuchMethod(
          Invocation.method(#doesBuildExistInProject, [projectId],
              {#withVersion: withVersion}),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<String> uploadWidgetDescriptionToProject(
          {String? projectId, _i9.WidgetDescription? description}) =>
      (super.noSuchMethod(
          Invocation.method(#uploadWidgetDescriptionToProject, [],
              {#projectId: projectId, #description: description}),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<List<_i9.WidgetDescription>> getWidgetDescriptionForProject(
          {String? projectId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getWidgetDescriptionForProject, [], {#projectId: projectId}),
              returnValue: Future<List<_i9.WidgetDescription>>.value(
                  <_i9.WidgetDescription>[]))
          as _i4.Future<List<_i9.WidgetDescription>>);
  @override
  _i4.Future<String> updateWidgetDescription(
          {String? projectId,
          _i9.WidgetDescription? oldwidgetDescription,
          _i9.WidgetDescription? newwidgetDescription}) =>
      (super.noSuchMethod(
          Invocation.method(#updateWidgetDescription, [], {
            #projectId: projectId,
            #oldwidgetDescription: oldwidgetDescription,
            #newwidgetDescription: newwidgetDescription
          }),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<String> deleteWidgetDescription(
          {String? projectId, _i9.WidgetDescription? description}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteWidgetDescription, [],
              {#projectId: projectId, #description: description}),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
}

/// A class which mocks [WidgetVisibiltyChangerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWidgetVisibiltyChangerService extends _i1.Mock
    implements _i13.WidgetVisibiltyChangerService {
  @override
  _i4.Completer<dynamic> get completer =>
      (super.noSuchMethod(Invocation.getter(#completer),
          returnValue: _FakeCompleter_2<dynamic>()) as _i4.Completer<dynamic>);
  @override
  set automationKeyName(_i14.SweetcoreCommand? _sweetcoreCommand) => super
      .noSuchMethod(Invocation.setter(#sweetcoreCommand, _sweetcoreCommand),
          returnValueForMissingStub: null);
  @override
  Iterable<_i9.WidgetDescription>? toggleVisibilty(
          Iterable<_i9.WidgetDescription>? widgetDescriptions) =>
      (super.noSuchMethod(
              Invocation.method(#toggleVisibilty, [widgetDescriptions]))
          as Iterable<_i9.WidgetDescription>?);
}
