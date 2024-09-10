
import 'package:equatable/equatable.dart';
import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';

abstract class GlucoseChartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GlucoseChartInit extends GlucoseChartState {}

class GlucoseChartLoading extends GlucoseChartState {}

class GlucoseChartLoaded extends GlucoseChartState {
  final List<BloodGlucose> glucoses;

  GlucoseChartLoaded(this.glucoses);

  @override
  List<Object?> get props => [glucoses];
}

class GlucoseChartError extends GlucoseChartState {
  final String error;

  GlucoseChartError(this.error);

  @override
  List<Object?> get props => [error];
}