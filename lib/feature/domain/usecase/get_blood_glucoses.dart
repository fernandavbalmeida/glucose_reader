import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';
import 'package:glucose_reader/feature/domain/repository/blood_glucose_repository.dart';

class GetBloodGlucoses {
  final BloodGlucoseRepository repository;

  const GetBloodGlucoses(this.repository);

  Future<List<BloodGlucose>> call() => repository.getBloodGlucoses();
}
