import 'package:glucose_reader/feature/blood_glucose_chart/data/model/blood_glucose_dto.dart';
import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';

class TestModels {
  static BloodGlucoseDto bloodGlucoseDto({
    String value = '2',
    String? timestamp,
    String unit = 'unit',
  }) {
    final String defaultTimestamp = timestamp ?? DateTime.now().toIso8601String();

    return BloodGlucoseDto(
      value: value,
      timestamp: defaultTimestamp,
      unit: unit,
    );
  }

  static BloodGlucose bloodGlucose({
    double value = 7.7,
    DateTime? timestamp,
    String unit = 'mmol/L',
  }) =>
      BloodGlucose(
        value: value,
        timestamp: timestamp ?? DateTime(2021, 2, 10, 9, 8, 0),
        unit: unit,
      );
}
