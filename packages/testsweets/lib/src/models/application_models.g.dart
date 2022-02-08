// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WidgetDescription _$$_WidgetDescriptionFromJson(Map<String, dynamic> json) =>
    _$_WidgetDescription(
      id: json['id'] as String?,
      originalViewName: json['originalViewName'] as String?,
      viewName: json['viewName'] as String?,
      name: json['name'] as String? ?? '',
      widgetType: _$enumDecodeNullable(_$WidgetTypeEnumMap, json['widgetType']),
      position: json['position'] == null
          ? null
          : WidgetPosition.fromJson(json['position'] as Map<String, dynamic>),
      visibility: json['visibility'] as bool? ?? true,
      targetIds: (json['targetIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_WidgetDescriptionToJson(
        _$_WidgetDescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalViewName': instance.originalViewName,
      'viewName': instance.viewName,
      'name': instance.name,
      'widgetType': _$WidgetTypeEnumMap[instance.widgetType],
      'position': instance.position,
      'visibility': instance.visibility,
      'targetIds': instance.targetIds,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$WidgetTypeEnumMap = {
  WidgetType.touchable: 'touchable',
  WidgetType.scrollable: 'scrollable',
  WidgetType.text: 'text',
  WidgetType.general: 'general',
  WidgetType.view: 'view',
  WidgetType.input: 'input',
};

_$_WidgetPosition _$$_WidgetPositionFromJson(Map<String, dynamic> json) =>
    _$_WidgetPosition(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      capturedDeviceWidth: (json['capturedDeviceWidth'] as num?)?.toDouble(),
      capturedDeviceHeight: (json['capturedDeviceHeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_WidgetPositionToJson(_$_WidgetPosition instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'capturedDeviceWidth': instance.capturedDeviceWidth,
      'capturedDeviceHeight': instance.capturedDeviceHeight,
    };
