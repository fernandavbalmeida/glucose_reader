import 'package:json_annotation/json_annotation.dart';

part 'blood_glucose_dto.g.dart';

@JsonSerializable()
class BloodGlucoseDto {
  final String value;
  final String timestamp;
  final String unit;

  BloodGlucoseDto({
    required this.value,
    required this.timestamp,
    required this.unit,
  });

  factory BloodGlucoseDto.fromJson(Map<String, dynamic> json) =>
      _$BloodGlucoseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BloodGlucoseDtoToJson(this);
}