// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_glucose_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodGlucoseDto _$BloodGlucoseDtoFromJson(Map<String, dynamic> json) =>
    BloodGlucoseDto(
      value: json['value'] as String,
      timestamp: json['timestamp'] as String,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$BloodGlucoseDtoToJson(BloodGlucoseDto instance) =>
    <String, dynamic>{
      'value': instance.value,
      'timestamp': instance.timestamp,
      'unit': instance.unit,
    };
