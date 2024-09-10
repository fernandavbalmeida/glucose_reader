import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_bloc.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_event.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_state.dart';
import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';
import 'package:glucose_reader/feature/domain/usecase/get_blood_glucoses.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBloodGlucoses extends Mock implements GetBloodGlucoses {}

void main() {
  group('GlucoseChartBloc', () {
    late GetBloodGlucoses getBloodGlucoses;
    late List<BloodGlucose> mockBloodGlucoses;

    setUp(() {
      getBloodGlucoses = MockGetBloodGlucoses();
      mockBloodGlucoses = [BloodGlucose(value: 2.0, timestamp: DateTime.now(), unit: 'mm/L')];  // Example glucose data
    });

    blocTest<GlucoseChartBloc, GlucoseChartState>(
      'emits [GlucoseChartLoading, GlucoseChartLoaded] when FetchGlucoseData event is added and data is successfully fetched',
      build: () {
        when(() =>getBloodGlucoses()).thenAnswer((_) async => mockBloodGlucoses);
        return GlucoseChartBloc(getBloodGlucoses);
      },
      act: (bloc) => bloc.add(FetchGlucoseData()),
      expect: () => [
        GlucoseChartLoading(),
        GlucoseChartLoaded(mockBloodGlucoses)
      ],
    );

    blocTest<GlucoseChartBloc, GlucoseChartState>(
      'emits [GlucoseChartLoading, GlucoseChartError] when FetchGlucoseData event is added and fetching data fails',
      build: () {
        when(() =>getBloodGlucoses()).thenThrow(Exception('Failed to fetch data'));
        return GlucoseChartBloc(getBloodGlucoses);
      },
      act: (bloc) => bloc.add(FetchGlucoseData()),
      expect: () => [
        GlucoseChartLoading(),
        GlucoseChartError('Failed to load glucose data')
      ],
    );
  });
}