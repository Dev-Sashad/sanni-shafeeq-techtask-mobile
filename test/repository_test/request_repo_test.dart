import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/repository/request_repo.dart';
import 'package:tech_task/data/network_request.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late NetworkService networkService;
  MockDio dio = MockDio();
  late RequestRepo _requstRepo;
  setUpAll(() {
    networkService = NetworkServiceImp(dio: dio, baseUrl: AppEndpoint.baseUrl);
    _requstRepo = RequestRepoImpl(networkService);
  });

  // group('Request Repository', () {
  //   test('Should return TRUE on get ingredients', () async {
  //     when(networkService.call(
  //             path: AppEndpoint.getIngredients, method: RequestMethod.post))
  //         .thenAnswer(
  //       (_) => Future.value(
  //           ApiModel(status: "Success", message: "Success", data: [])),
  //     );
  //     final result = await _requstRepo.getIngredient();
  //     expect(result.status, false);
  //   });

  //   test('Should return FALSE on get ingredients', () async {
  //     when(networkService.call(
  //             path: AppEndpoint.getIngredients, method: RequestMethod.post))
  //         .thenAnswer(
  //       (_) => Future.value(ApiModel(
  //         status: "Error",
  //         message: "Internet Error",
  //       )),
  //     );

  //     final result = await _requstRepo.getIngredient();
  //     expect(result.status, false);
  //   });

  //   test('Should return TRUE on get recipes', () async {
  //     when(networkService.call(
  //             path: AppEndpoint.getRecipes, method: RequestMethod.post))
  //         .thenAnswer(
  //       (_) => Future.value(ApiModel(status: "Success", message: "Success")),
  //     );
  //     final result = await _requstRepo.getReceipe(query: "");
  //     expect(result.status, true);
  //   });
  // });
}
