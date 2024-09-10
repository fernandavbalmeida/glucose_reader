import 'package:equatable/equatable.dart';

class BloodGlucose extends Equatable {
  final double value;
  final DateTime timestamp;
  final String unit;

  const BloodGlucose({
    required this.value,
    required this.timestamp,
    required this.unit,
  });

  @override
  List<Object?> get props => [value, timestamp, unit];
}