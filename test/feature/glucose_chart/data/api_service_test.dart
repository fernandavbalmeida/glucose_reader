import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/remote/api_service.dart';
import 'package:glucose_reader/feature/blood_glucose_chart/data/remote/api_service_impl.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late ApiService api;
  late MockDio dio;
  late _ArrangeBuilder builder;

  setUp(() {
    dio = MockDio();
    api = ApiServiceImpl(dio: dio);
    builder = _ArrangeBuilder(
      dio,
    );
  });

  group('fetchBloodGlucoses', () {

///////
//     test('fetches empty glucoses successfully', () async {
//       builder.withSuccessfulGetListResponse(
//         <DioResponseType>[],
//       );
//
//       final result = await api.fetchBloodGlucoses();
//
//       expect(result, isA<List<BloodGlucoseDto>>());
//       expect(result, isEmpty);
//     });
//
//     test('fetches non-empty glucoses successfully', () async {
//       builder.withSuccessfulGetListResponse(
//           <DioResponseType>[
//             {
//               'bloodGlucoseSamples': [
//                 {
//                   'value': '7.7',
//                   'timestamp': '2021-02-10T09:08:00',
//                   'unit': 'mmol/L',
//                 },
//                 {
//                   'value': '8.3',
//                   'timestamp': '2021-02-10T10:25:00',
//                   'unit': 'mmol/L',
//                 },
//               ],
//             }
//           ]);
//
//       final result = await api.fetchBloodGlucoses();
//
//       expect(result, hasLength(2));
//     });

    test('sends get request to valid endpoint', () async {
      // Arrange
      builder.withSuccessfulGetListResponse<Map<String, dynamic>>(
        {'bloodGlucoseSamples': []},
        url: 'https://s3-de-central.profitbricks.com/una-health-frontend-tech-challenge/sample.json',
      );

      // Act
      await api.fetchBloodGlucoses();

      // Assert
      verify(() => dio.getUri<Map<String, dynamic>>(
        Uri.parse(
          'https://s3-de-central.profitbricks.com/una-health-frontend-tech-challenge/sample.json',
        ),
      )).called(1);
    });

    test('throws http exception when invalid response', () async {
      builder.withResponseAssertThrows();

      expect(
            () async =>
            api.fetchBloodGlucoses(),
        throwsA(isA<HttpException>()),
      );
    });


  });
}


class _ArrangeBuilder {
  _ArrangeBuilder(this.dio);

  final Dio dio;

  void withSuccessfulGetListResponse<T>(T data, {required String url}) {
    when(() => MockDio().getUri<T>(
      Uri.parse(url),
    )).thenAnswer(
          (_) async => Response<T>(
        requestOptions: RequestOptions(path: url),
        data: data,
        statusCode: 200,
      ),
    );
  }

  void withFailedGetResponse(int status, [dynamic data]) {
    when(() =>
        MockDio().getUri(
          any(),
        )).thenAnswer(
          (_) async =>
          Response<dynamic>(
            requestOptions: RequestOptions(path: 'any'),
            data: data,
            statusCode: status,
          ),
    );
  }

  void withResponseAssertSuccess<T>(T data, {required String url}) {
    when(() => MockDio().get<T>(url)).thenAnswer(
          (_) async => Response<T>(
        requestOptions: RequestOptions(path: url),
        data: data,
        statusCode: 200,
      ),
    );
  }

  void withResponseAssertThrows() {
    when(() => MockDio().get(any())).thenThrow(const HttpException('Invalid response'));
  }

}

class MockDio extends Mock implements Dio {}
