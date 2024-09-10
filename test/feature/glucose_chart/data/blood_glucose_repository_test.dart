import 'package:flutter_test/flutter_test.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/blood_glucose_repository_impl.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/remote/api_service.dart';
import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';
import 'package:glucose_reader/feature/domain/repository/blood_glucose_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_models.dart';

void main() {
  late ApiService apiService;
  late _ArrangeBuilder builder;
  late BloodGlucoseRepository repository;

  setUp(() {
    apiService = MockApi();
    builder = _ArrangeBuilder(api: apiService);
    repository = BloodGlucoseRepositoryImpl(apiService: apiService);
  });

  group('get blood glucoses', () {
    test('is blood glucose type', () async {
      final bloodGlucoses = await repository.getBloodGlucoses();

      expect(bloodGlucoses, isA<List<BloodGlucose>>());
      expect(bloodGlucoses, hasLength(1));
      expect(bloodGlucoses.first, isA<BloodGlucose>());
      expect(bloodGlucoses.first.value, 2.0);
      expect(bloodGlucoses.first.timestamp, isA<DateTime>());
      expect(bloodGlucoses.first.unit, 'unit');
    });

    test('fetchBloodGlucoses is called', () async {
      await repository.getBloodGlucoses();

      verify(() => apiService.fetchBloodGlucoses()).called(1);
    });

    test('throws when api throws', () async {
      builder.withApiError();

      final result = repository.getBloodGlucoses();

      expect(() async => result, throwsException);
    });
  });
}

class _ArrangeBuilder {
  _ArrangeBuilder({required ApiService api}) : _api = api {
    when(() => api.fetchBloodGlucoses())
        .thenAnswer((_) async => [TestModels.bloodGlucoseDto()]);
  }

  final ApiService _api;

  void withApiError() {
    when(() => _api.fetchBloodGlucoses())
        .thenAnswer((_) async => throw Exception());
  }
}

class MockApi extends Mock implements ApiService {}
