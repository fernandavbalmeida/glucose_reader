import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_event.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_state.dart';
import 'package:glucose_reader/feature/domain/usecase/get_blood_glucoses.dart';

class GlucoseChartBloc extends Bloc<GlucoseChartEvent, GlucoseChartState> {
  final GetBloodGlucoses getBloodGlucoses;

  GlucoseChartBloc(this.getBloodGlucoses) : super(GlucoseChartInit()) {
    on<FetchGlucoseData>(_onFetchGlucoseDate);
  }

  FutureOr<void> _onFetchGlucoseDate(FetchGlucoseData event, Emitter<GlucoseChartState> emit) async {
    emit(GlucoseChartLoading());
    try {
      final bloodGlucoses = await getBloodGlucoses();
      emit(GlucoseChartLoaded(bloodGlucoses));
    } catch (e) {
      emit(GlucoseChartError('Failed to load glucose data'));
    }
  }
}
