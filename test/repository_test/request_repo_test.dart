import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/repository/request_repo.dart';
import 'package:tech_task/data/network_request.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  // late RequestRepoImpl requestRepo;
  // late MockNetworkService mockNetworkService;

  // setUp(() {
  //   mockNetworkService = MockNetworkService();
  //   requestRepo = RequestRepoImpl(mockNetworkService);
  // });

  // group('getIngredient', () {
  //   test(
  //       'returns BaseResponse with status true when network call is successful',
  //       () async {
  //     final mockResult = ApiModel(status: 'Success', message: 'Success', data: [
  //       {"title": "Ham", "use-by": "2020-11-25"}
  //     ]);
  //     when(mockNetworkService.call(
  //         path: AppEndpoint.getIngredients,
  //         method: RequestMethod.get,
  //         body: {})).thenAnswer((_) async => Future.value(mockResult));

  //     final result = await requestRepo.getIngredient();

  //     expect(result.status, true);
  //     expect(result.message, mockResult.message);
  //     expect(result.title, mockResult.status);
  //     expect(result.data, isA<List>());
  //   });

  //   test('returns BaseResponse with status false when network call fails',
  //       () async {
  //     final mockResult = ApiModel(
  //       status: 'Error',
  //       message: 'Failure',
  //     );
  //     when(mockNetworkService.call(
  //         path: AppEndpoint.getIngredients,
  //         method: RequestMethod.get,
  //         body: {})).thenAnswer((_) async => Future.value(mockResult));

  //     final result = await requestRepo.getIngredient();

  //     expect(result.status, false);
  //     expect(result.message, mockResult.message);
  //     expect(result.title, mockResult.status);
  //     expect(result.data, isNull);
  //   });

  //   test(
  //       'should return BaseResponse with status false when network call throws an error',
  //       () async {
  //     when(mockNetworkService.call(
  //       path: AppEndpoint.getIngredients,
  //       method: RequestMethod.get,
  //       body: {},
  //     )).thenThrow(Exception('Failed to retrieve data'));

  //     final response = await requestRepo.getIngredient();

  //     expect(response.status, false);
  //     expect(response.message, 'An error occurred');
  //     expect(response.title, 'Error');
  //     expect(response.data, isNull);
  //   });
  // });

  // group('getReceipe', () {
  //   test(
  //       'should return BaseResponse with status true when network call is successful',
  //       () async {
  //     final result = ApiModel(
  //         status: 'Success',
  //         message: 'Data retrieved successfully',
  //         data: [
  //           {
  //             'name': 'Pancakes',
  //             'ingredients': ['eggs', 'flour']
  //           },
  //         ]);

  //     when(mockNetworkService.call(
  //       path: AppEndpoint.getRecipes,
  //       method: RequestMethod.get,
  //       body: {},
  //       queryParams: {'ingredients': 'eggs,flour'},
  //     )).thenAnswer((_) async => Future.value(result));

  //     final response = await requestRepo.getReceipe(query: 'eggs,flour');

  //     expect(response.status, true);
  //     expect(response.message, result.message);
  //     expect(response.title, result.status);
  //     expect(response.data, result.data);
  //   });

  // test(
  //     'should return BaseResponse with status false when network call is unsuccessful',
  //     () async {
  //   final result = ApiModel(status: 'Error', message: 'An error occurred');

  //   when(mockNetworkService.call(
  //     path: AppEndpoint.getRecipes,
  //     method: RequestMethod.get,
  //     body: {},
  //     queryParams: {'ingredients': 'eggs,flour'},
  //   )).thenAnswer((_) async => result);

  //   final response = await requestRepo.getReceipe(query: 'eggs,flour');

  //   expect(response.status, false);
  //   expect(response.message, result.message);
  //   expect(response.title, result.data);
  //   expect(response.data, isNull);
  // });
  // });
}
