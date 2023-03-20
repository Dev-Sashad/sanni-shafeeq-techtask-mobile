import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/repository/request_repo.dart';
import 'package:tech_task/data/network_request.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  late RequestRepo _requstRepo;
  late MockNetworkService networkService;
  setUpAll(() {
    _requstRepo = locator<RequestRepo>();
    networkService = MockNetworkService();
  });

  group('Request Repository', () {
    test('Should return TRUE on get ingredients', () async {
      when(networkService.call(
              path: AppEndpoint.getIngredients, method: RequestMethod.post))
          .thenAnswer(
        (_) => Future.value(
            ApiModel(status: "Success", message: "Success", data: [])),
      );
      final result = await _requstRepo.getIngredient();
      expect(result.status, true);
    });

    test('Should return FALSE on get ingredients', () async {
      when(networkService.call(
              path: AppEndpoint.getIngredients, method: RequestMethod.post))
          .thenAnswer(
        (_) => Future.value(
            ApiModel(status: "Error", message: "Internet Error", data: [])),
      );

      final result = await _requstRepo.getIngredient();
      expect(result.status, false);
    });

    test('Should return TRUE on get recipes', () async {
      when(networkService.call(
              path: AppEndpoint.getRecipes, method: RequestMethod.post))
          .thenAnswer(
        (_) => Future.value(ApiModel(status: "Success", message: "Success")),
      );
      final result = await _requstRepo.getReceipe(query: "");
      expect(result.status, true);
    });
  });
}
