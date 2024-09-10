import 'package:glucose_reader/feature/blood_glucose_chart/data/model/blood_glucose_dto.dart';

abstract class ApiService {
  Future<List<BloodGlucoseDto>> fetchBloodGlucoses();
}
