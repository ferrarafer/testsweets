import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:testsweets/src/enums/popup_menu_action.dart';
import 'package:testsweets/src/enums/widget_type.dart';
import 'package:testsweets/src/extensions/capture_widget_status_enum_extension.dart';

import 'package:testsweets/src/extensions/widget_description_extension.dart';
import 'package:testsweets/src/models/application_models.dart';
import 'package:testsweets/src/ui/shared/app_colors.dart';
import 'package:testsweets/src/ui/shared/popup_menu/popup_menu_content.dart';
import 'package:testsweets/src/ui/widget_capture/widget_capture_viewmodel.dart';
import 'package:testsweets/src/ui/widget_capture/widget_capture_widgets/connection_painter.dart';
import 'package:testsweets/src/ui/widget_capture/widget_capture_widgets/widget_circle.dart';

import '../../shared/popup_menu/custom_popup_menu.dart';
import 'draggable_widget.dart';

class WidgetsVisualizer extends StatelessWidget {
  final Function editActionSelected;
  const WidgetsVisualizer({
    Key? key,
    required this.editActionSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<WidgetCaptureViewModel>();
    final size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (model.captureWidgetStatusEnum.showConnections)
          ...model.descriptionsForView
              // All the widgets that have a connections
              .where((element) => element.targetIds.isNotEmpty)
              .map((description) => CustomPaint(
                    size: size,
                    foregroundPainter: ConnectionPainter(
                        sourcePointType: description.widgetType,
                        sourcePoint: description.responsiveOffset(size),
                        targetPoints: getTargetPointsOffsetsForThisWidget(
                            model, description, size)),
                  )),
        if (model.captureWidgetStatusEnum.showWidgets)
          ...model.descriptionsForView
              // Show all the widgetTypes except views
              .where((element) => element.widgetType != WidgetType.view)
              .map(
                (description) => Positioned(
                  top: description.responsiveYPosition(size.height),
                  left: description.responsiveXPosition(size.width),
                  child: CustomPopupMenu(
                    disable: model.captureWidgetStatusEnum.attachMode,
                    onMoveStart: () =>
                        model.startQuickPositionEdit(description),
                    onTap: model.captureWidgetStatusEnum.attachMode
                        ? () async => await model.addNewTarget(description.id!)
                        : model.captureWidgetStatusEnum.deattachMode
                            ? () async =>
                                await model.removeTarget(description.id!)
                            : null,
                    onLongPressUp: model.onLongPressUp,
                    onLongPressMoveUpdate: (position) {
                      final x = position.globalPosition.dx;
                      final y = position.globalPosition.dy;
                      model.updateDescriptionPosition(
                          x, y, size.width, size.height);
                    },
                    barrierColor: kcBackground.withOpacity(0.3),
                    showArrow: false,
                    menuBuilder: () => PopupMenuContent(
                      showUnattachOption: description.targetIds.isNotEmpty,
                      showAttachOption: (description.targetIds.length +
                              2) < // 2 is for one widget and its view
                          model.descriptionsForView.length,
                      onMenuAction: (popupMenuAction) async {
                        await model.popupMenuActionSelected(
                            description, popupMenuAction);
                        if (popupMenuAction == PopupMenuAction.edit) {
                          /// When called will show the widgetform
                          editActionSelected();
                        }
                      },
                    ),
                    pressType: PressType.longPress,

                    /// When you long press and drag replace this widget with sizedbox
                    /// to avoid dublicates, cause it's using DraggableWidget while you move it
                    child: description.id == model.widgetDescription?.id
                        ? const SizedBox.shrink()
                        : WidgetCircle(
                            transparency: description.visibility ? 1 : 0.5,
                            key: Key(description.automationKey),
                            widgetType: description.widgetType,
                          ),
                  ),
                ),
              ),
        if (model.captureWidgetStatusEnum.showDraggableWidget)
          DraggableWidget(),
      ],
    );
  }

  List<Offset> getTargetPointsOffsetsForThisWidget(
      WidgetCaptureViewModel model, WidgetDescription description, Size size) {
    return model.descriptionsForView
        .where((element) => description.targetIds.contains(element.id))
        .map((e) => e.responsiveOffset(size))
        .toList();
  }
}