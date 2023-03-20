import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/data/network_request.dart';

final successUrl = "google.com";
final errorUrl = "g.com";

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  NetworkService? networkService;
  setUpAll(() {
    networkService = MockNetworkService();
  });

  group('Dio service methods test', () {
    test('Should return success when GET request status is success', () async {
      final response = await networkService!
          .call(path: successUrl, method: RequestMethod.get);

      expect(response.status, "Success");
    });

    test('Should return error when GET request status is error', () async {
      final response =
          await networkService!.call(path: errorUrl, method: RequestMethod.get);

      expect(response.status, "Error");
    });

    test('Should return error when GET request is not successful', () async {
      final response =
          await networkService!.call(path: '', method: RequestMethod.get);

      expect(response.data, throwsA(isA<Null>()));
    });
  });
}
