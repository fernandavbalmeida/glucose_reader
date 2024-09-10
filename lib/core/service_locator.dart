import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/blood_glucose_repository_impl.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/remote/api_service.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/remote/api_service_impl.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_bloc.dart';
import 'package:glucose_reader/feature/domain/usecase/get_blood_glucoses.dart';
import 'package:glucose_reader/feature/domain/repository/blood_glucose_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(() => GlucoseChartBloc(sl()))
    ..registerLazySingleton(() => GetBloodGlucoses(sl()))
    ..registerLazySingleton<BloodGlucoseRepository>(
            () => BloodGlucoseRepositoryImpl(apiService: sl()))
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<ApiService>(
          () => ApiServiceImpl(dio: sl<Dio>()),
    );
}
