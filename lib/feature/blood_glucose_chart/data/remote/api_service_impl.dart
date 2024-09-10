import 'package:dio/dio.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/model/blood_glucose_dto.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/remote/api_service.dart';

typedef DioResponseType = dynamic;

class ApiServiceImpl implements ApiService {
  const ApiServiceImpl({required this.dio});

  static const String apiKey = 'de27b5cf7b8ca3548a293e502a551d5c';
  static const String baseUrl = 'https://ws.audioscrobbler.com/2.0/';

  final Dio dio;

  @override
  Future<List<BloodGlucoseDto>> fetchBloodGlucoses() async {
    final response = await dio.getUri(
      Uri.parse(
        'https://s3-de-central.profitbricks.com/una-health-frontend-tech-challenge/sample.json',
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data['bloodGlucoseSamples'] as List<dynamic>;
      final bloodGlucoseList = jsonList
          .map((sampleJson) => BloodGlucoseDto.fromJson(sampleJson as Map<String, dynamic>))
          .toList();

      return bloodGlucoseList;
    } else {
      throw Exception('Failed to load sample');
    }
  }
}
