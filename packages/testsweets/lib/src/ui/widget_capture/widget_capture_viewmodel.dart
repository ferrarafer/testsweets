import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testsweets/src/app/logger.dart';
import 'package:testsweets/src/enums/capture_widget_enum.dart';
import 'package:testsweets/src/enums/toast_type.dart';
import 'package:testsweets/src/enums/widget_type.dart';
import 'package:testsweets/src/extensions/string_extension.dart';
import 'package:testsweets/src/locator.dart';
import 'package:testsweets/src/models/application_models.dart';
import 'package:testsweets/src/services/testsweets_route_tracker.dart';
import 'package:testsweets/src/services/widget_capture_service.dart';
import 'package:testsweets/src/ui/widget_capture/widget_capture_view.form.dart';

class WidgetCaptureViewModel extends FormViewModel {
  final log = getLogger('WidgetCaptureViewModel');

  final _testSweetsRouteTracker = locator<TestSweetsRouteTracker>();
  final _widgetCaptureService = locator<WidgetCaptureService>();
  final _snackbarService = locator<SnackbarService>();

  CaptureWidgetStatusEnum _captureWidgetStatusEnum =
      CaptureWidgetStatusEnum.idle;

  /// We use this position as the starter point of any new widget
  late WidgetPosition screenCenterPosition;

  set captureWidgetStatusEnum(CaptureWidgetStatusEnum captureWidgetStatusEnum) {
    _captureWidgetStatusEnum = captureWidgetStatusEnum;
    notifyListeners();
  }

  CaptureWidgetStatusEnum get captureWidgetStatusEnum =>
      _captureWidgetStatusEnum;

  WidgetCaptureViewModel({required String projectId}) {
    _widgetCaptureService.projectId = projectId;
    _testSweetsRouteTracker.addListener(notifyListeners);
  }

  WidgetDescription? widgetDescription;

  List<WidgetDescription> get descriptionsForView =>
      _widgetCaptureService.getDescriptionsForView(
        currentRoute: _testSweetsRouteTracker.currentRoute,
      );
  bool get currentViewIsCaptured => descriptionsForView.any(
        (element) => element.widgetType == WidgetType.view,
      );
  String get currentViewName => _testSweetsRouteTracker.formatedCurrentRoute;
  Future<void> loadWidgetDescriptions() async {
    log.v('');
    setBusy(true);
    try {
      await _widgetCaptureService.loadWidgetDescriptionsForProject();
      setBusy(false);
    } catch (e) {
      log.e('Could not get widgetDescriptions: $e');
      _snackbarService.showCustomSnackBar(
          message: 'Could not get widgetDescriptions: $e',
          variant: ToastType.failed);
    }
  }

  set setWidgetType(WidgetType widgetType) {
    log.v(widgetType);
    widgetDescription = widgetDescription!.copyWith(widgetType: widgetType);
    notifyListeners();
  }

  set setVisibilty(bool visible) {
    log.v(visible);
    widgetDescription = widgetDescription!.copyWith(visibility: visible);
    notifyListeners();
  }

  void clearWidgetDescriptionForm() {
    log.v('');
    widgetDescription = null;
    captureWidgetStatusEnum = CaptureWidgetStatusEnum.idle;
  }

  /// When open the form create new instance of widgetDescription
  /// if it's null and set [CaptureWidgetStatusEnum.widgetInfoForm]
  void showWidgetForm() {
    widgetDescription =
        widgetDescription ?? WidgetDescription(position: screenCenterPosition);
    captureWidgetStatusEnum = CaptureWidgetStatusEnum.widgetInfoForm;
  }

  void updateDescriptionPosition(
    double x,
    double y,
    double capturedDeviceWidth,
    double capturedDeviceHeight,
  ) {
    widgetDescription = widgetDescription!.copyWith(
      position: WidgetPosition(
        capturedDeviceHeight: capturedDeviceHeight,
        capturedDeviceWidth: capturedDeviceWidth,
        x: (widgetDescription!.position?.x ?? capturedDeviceWidth / 2) + x,
        y: (widgetDescription!.position?.y ?? capturedDeviceHeight / 2) + y,
      ),
    );
    notifyListeners();
  }

  void editMode(WidgetDescription description) {
    widgetDescription = description;
    showWidgetForm();
    notifyListeners();
  }

  Future<String?> saveWidget({WidgetPosition? screenCenter}) async {
    log.i(widgetDescription);

    setBusy(true);
    widgetDescription = widgetDescription?.copyWith(
      name: widgetNameValue!.convertWidgetNameToValidFormat,
      viewName:
          _testSweetsRouteTracker.currentRoute.convertViewNameToValidFormat,
      originalViewName: _testSweetsRouteTracker.currentRoute,
    );

    log.i('descriptionToSave:$widgetDescription');

    final result = await _widgetCaptureService.captureWidgetDescription(
        description: widgetDescription!);

    if (result is String) {
      _snackbarService.showCustomSnackBar(
          message: result, variant: ToastType.failed);
    } else {
      widgetDescription = null;
      captureWidgetStatusEnum = CaptureWidgetStatusEnum.idle;
    }
    setBusy(false);
    return result;
  }

  Future<String?> updateWidgetDescription() async {
    log.i(widgetDescription);

    setBusy(true);

    final result = await _widgetCaptureService.updateWidgetDescription(
        description: widgetDescription!);

    if (result is String) {
      _snackbarService.showCustomSnackBar(
          message: result, variant: ToastType.failed);
    } else {
      captureWidgetStatusEnum = CaptureWidgetStatusEnum.idle;
      widgetDescription = null;
    }

    setBusy(false);
    return result;
  }

  Future<String?> removeWidgetDescription(
      WidgetDescription widgetDescription) async {
    log.i(widgetDescription);

    setBusy(true);

    final result = await _widgetCaptureService.deleteWidgetDescription(
        description: widgetDescription);
    if (result is String) {
      _snackbarService.showCustomSnackBar(
          message: result, variant: ToastType.failed);
    }

    setBusy(false);
    return result;
  }

  @override
  void setFormStatus() {
    log.v('widgetNameValue: $widgetNameValue');

    widgetDescription =
        widgetDescription?.copyWith(name: widgetNameValue ?? '');
    notifyListeners();
  }

  Future<String?> submitForm() async {
    if (widgetDescription?.id != null) {
      return await updateWidgetDescription();
    } else {
      return await saveWidget();
    }
  }
}
