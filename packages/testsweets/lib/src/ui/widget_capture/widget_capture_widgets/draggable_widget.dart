import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:testsweets/src/extensions/widget_description_extension.dart';
import 'package:testsweets/src/ui/widget_capture/widget_capture_viewmodel.dart';

import 'widget_circle.dart';

class DraggableWidget extends ViewModelWidget<WidgetCaptureViewModel> {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetCaptureViewModel model) {
    final size = MediaQuery.of(context).size;
    return Positioned(
        top: model.widgetDescription?.responsiveYPosition(size.height) ??
            size.height / 2,
        left: model.widgetDescription?.responsiveXPosition(size.width) ??
            size.width / 2,
        child: GestureDetector(
          onPanUpdate: (panEvent) {
            final x = panEvent.delta.dx;
            final y = panEvent.delta.dy;
            model.updateDescriptionPosition(x, y, size.width, size.height);
          },
          child: WidgetCircle(widgetType: model.widgetDescription!.widgetType),
        ));
  }
}
