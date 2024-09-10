import 'package:equatable/equatable.dart';

abstract class GlucoseChartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchGlucoseData extends GlucoseChartEvent {}
