import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/repository/request_repo.dart';
import 'package:tech_task/data/network_request.dart';

class MockDio extends Mock implements Dio {}

class MockWidgetRef extends Mock implements WidgetRef {}

void main() {
//   late NetworkService networkService;
//   MockDio dio = MockDio();
//   late RequestRepo _requstRepo;
//   setUpAll(() {
//     networkService = NetworkServiceImp(dio: dio, baseUrl: AppEndpoint.baseUrl);
//     _requstRepo = RequestRepoImpl(networkService);
//   });

//   // group('Home viewmodel test', () {
//   //   test('Should return LoadingState.error when get ingredents is called',
//   //       () async {
//   //     final vm = ChangeNotifierProvider<HomeVm>(
//   //       (ref) => HomeVm(ref, _requstRepo),
//   //     );
//   //     await MockWidgetRef().read(vm).getIngredients();
//   //     expect(MockWidgetRef().read(vm).homestate, LoadingState.error);
//   //   });

//   //   test('Should return false when get recipes is called', () async {
//   //     final vm = ChangeNotifierProvider<HomeVm>(
//   //       (ref) => HomeVm(ref, _requstRepo),
//   //     );
//   //     final result = await MockWidgetRef().read(vm).suggestLunch();
//   //     expect(result, false);
//   //   });
//   // });
}
