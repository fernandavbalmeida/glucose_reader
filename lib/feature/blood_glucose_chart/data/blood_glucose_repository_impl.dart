import 'package:glucose_reader/feature/blood_glucose_chart/data/remote/api_service.dart';
import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';
import 'package:glucose_reader/feature/domain/repository/blood_glucose_repository.dart';

class BloodGlucoseRepositoryImpl implements BloodGlucoseRepository {
  const BloodGlucoseRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<BloodGlucose>> getBloodGlucoses() async {
    final bloodGlucoses = await apiService.fetchBloodGlucoses();
    return bloodGlucoses
        .map((bloodGlucose) => BloodGlucose(
              value: double.parse(bloodGlucose.value),
              timestamp: DateTime.parse(bloodGlucose.timestamp),
              unit: bloodGlucose.unit,
            ))
        .toList();
  }
}
