import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_bloc.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/bloc/glucose_chart_state.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/presentation/widgets/glucose_chart_widget.dart';

class GlucoseChartPage extends StatelessWidget {
  const GlucoseChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(  // Ensures content is within the safe bounds of the device
        child: Column(
          children: [
            const SizedBox(height: 20), // Space from the top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Start')),
                ElevatedButton(onPressed: () {}, child: const Text('End')),
              ],
            ),
            Expanded(
              child: BlocBuilder<GlucoseChartBloc, GlucoseChartState>(
                builder: (context, state) {
                  if (state is GlucoseChartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GlucoseChartLoaded) {
                    return GlucoseChartWidget(glucoses: state.glucoses);
                  } else if (state is GlucoseChartError) {
                    return Center(child: Text(state.error));
                  }
                  return Container(); // Default empty state
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Min')),
                const SizedBox(width: 8),  // Space between the buttons
                ElevatedButton(onPressed: () {}, child: const Text('Max')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Avg')),
                const SizedBox(width: 8),  // Space between the buttons
                ElevatedButton(onPressed: () {}, child: const Text('Median')),
              ],
            ),
            const SizedBox(height: 20), // Space at the bottom
          ],
        ),
      ),
    );
  }
}