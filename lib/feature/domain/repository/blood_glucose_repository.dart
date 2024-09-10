import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';

abstract class BloodGlucoseRepository {
  Future<List<BloodGlucose>> getBloodGlucoses();
}