import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glucose_reader/core/service_locator.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_bloc.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_event.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/glucose_chart_page.dart';

import 'core/service_locator.dart' as di;

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      di.init();
      runApp(const MyApp());
    },
    _handleError,
  );
}

Future<void> _handleError(dynamic error, dynamic stackTrace) async {
  //TODO build log
  print('some error occured');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glucose Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => sl<GlucoseChartBloc>()..add(FetchGlucoseData()),
        child: GlucoseChartPage(),
      ),
    );
  }
}
