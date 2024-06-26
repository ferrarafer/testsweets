import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:testsweets/src/extensions/capture_widget_status_enum_extension.dart';
import 'package:testsweets/src/ui/shared/busy_indecator.dart';
import 'package:testsweets/src/ui/widget_capture/widget_capture_viewmodel.dart';

import '../route_banner/route_banner_view.dart';
import 'widgets/draggable_widget.dart';
import 'widgets/interaction_form_and_visualizer.dart';

class WidgetCaptureView extends StatelessWidget {
  final String projectId;
  final String? apiKey;
  final Widget child;

  WidgetCaptureView({
    required this.child,
    required this.projectId,
    this.apiKey,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return ViewModelBuilder<WidgetCaptureViewModel>.reactive(
      disposeViewModel: false,
      onViewModelReady: (model) async {
        model.setSnackbarContext(context);

        await model.loadWidgetDescriptions();
      },
      builder: (context, model, _) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            NotificationListener(
              onNotification: (notification) {
                if (notification is Notification) {
                  model.onClientNotifiaction(notification);
                }
                return false;
              },
              child: child,
            ),
            ValueListenableBuilder(
              valueListenable: model.interactionsForViewNotifier,
              builder: (_, __, ___) => RouteBannerView(
                isCaptured: model.currentViewCaptured,
              ),
            ),
            if (model.captureState.showDraggableWidget) const DraggableWidget(),
            const InteractionFormAndVisualizer(),
            BusyIndicator(
              center: model.busy(
                WidgetCaptureViewModel.fullScreenBusyIndicator,
              ),
              side: model.busy(WidgetCaptureViewModel.sideBusyIndicator),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => WidgetCaptureViewModel(
        projectId: projectId,
        currentScreenSize: size,
        orientation: orientation,
      ),
    );
  }
}
