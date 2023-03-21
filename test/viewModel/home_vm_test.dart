import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/model/base_response.dart';
import 'package:tech_task/core/repository/request_repo.dart';

class MockRequestRepo extends Mock implements RequestRepo {}

class MockRef extends Mock implements Ref {}

void main() {
//   late HomeVm homeVm;
//   late MockRequestRepo mockRequestRepo;

//   setUp(() {
//     mockRequestRepo = MockRequestRepo();
//     homeVm = HomeVm(MockRef(), mockRequestRepo);
//   });

//   group('HomeVm Tests', () {
//     test('Test initGreeting() sets greeting correctly', () {
//       homeVm.initGreeting();
//       expect(homeVm.greeting,
//           anyOf("Good Morning", "Good Afternoon", "Good Evening"));
//     });

//     test('Test initLunchValue() sets lunchValue correctly', () {
//       homeVm.setLunchDate(DateTime(2022, 10, 15));
//       homeVm.initLunchValue();
//       expect(homeVm.lunchValue, "Oct 15, 2022");
//     });

//     test('Test addtoQueryList() adds item to the list', () {
//       homeVm.addtoQueryList("onions");
//       expect(homeVm.ingredients.contains("onions"), true);
//     });

//     test('Test suggestLunch() returns list of suggested recipes', () async {
//       when(mockRequestRepo.getReceipe(query: "onions,garlic"))
//           .thenAnswer((_) async => BaseResponse(status: true, data: [
//                 {
//                   "id": 1,
//                   "title": "Onion Soup",
//                   "image": "https://www.example.com/onion-soup.jpg",
//                   "readyInMinutes": 30,
//                   "servings": 4,
//                 },
//                 {
//                   "id": 2,
//                   "title": "Garlic Bread",
//                   "image": "https://www.example.com/garlic-bread.jpg",
//                   "readyInMinutes": 20,
//                   "servings": 6,
//                 }
//               ]));

//       homeVm.addtoQueryList("onions");
//       homeVm.addtoQueryList("garlic");
//       final result = await homeVm.suggestLunch();
//       expect(result, true);
//       expect(homeVm.queryresult.state.length, 2);
//       expect(homeVm.queryresult.state.first.title, "Onion Soup");
//       expect(homeVm.queryresult.state.first.readyInMinutes, 30);
//     });

//     test(
//         'Test suggestLunch() returns false and shows error dialog when API call fails',
//         () async {
//       when(mockRequestRepo.getReceipe(query: "onions,garlic"))
//           .thenThrow(Exception("API Error"));

//       homeVm.addtoQueryList("onions");
//       homeVm.addtoQueryList("garlic");
//       final result = await homeVm.suggestLunch();
//       expect(result, false);
//     });

//     test('setLunchDate should update the lunch date and call notifyListeners()',
//         () {
//       final dateTime = DateTime.now().add(Duration(days: 1));
//       expect(homeVm.lunchDate, isNot(dateTime));
//       expect(homeVm.lunchValue, isNot("Tomorrow"));
//       homeVm.setLunchDate(dateTime);
//       expect(homeVm.lunchDate, equals(dateTime));
//       expect(homeVm.lunchValue, equals("Tomorrow"));
//     });

// // Test case 7
//     test(
//         'addtoQueryList should add or remove items from the query list and call notifyListeners()',
//         () {
//       final queryList = homeVm.ingredients.map((e) => e.name).toList();
//       final ingredientName = homeVm.ingredients[0].name;
//       expect(homeVm.queryIngredients.state, isNot(contains(ingredientName)));
//       homeVm.addtoQueryList(ingredientName);
//       expect(homeVm.queryIngredients.state, contains(ingredientName));
//       homeVm.addtoQueryList(ingredientName);
//       expect(homeVm.queryIngredients.state, isNot(contains(ingredientName)));
//     });

// // Test case 8
//     test(
//         'initGreeting should initialize the greeting message based on time of day and call notifyListeners()',
//         () {
//       final now = TimeOfDay.now();
//       final evening = TimeOfDay(hour: 20, minute: 0);
//       final morningGreeting = "Good Morning";
//       final afternoonGreeting = "Good Afternoon";
//       final eveningGreeting = "Good Evening";
//       if (now.hour < 12) {
//         expect(homeVm.greeting, equals(morningGreeting));
//       } else if (now.hour < 19) {
//         expect(homeVm.greeting, equals(afternoonGreeting));
//       } else {
//         expect(homeVm.greeting, equals(eveningGreeting));
//       }
//       homeVm.initGreeting();
//       if (evening.hour < 12) {
//         expect(homeVm.greeting, equals(morningGreeting));
//       } else if (evening.hour < 19) {
//         expect(homeVm.greeting, equals(afternoonGreeting));
//       } else {
//         expect(homeVm.greeting, equals(eveningGreeting));
//       }
//     });

// // Test case 9
//     test(
//         'getIngredients should set the loading state, call the requestRepo, update the ingredients list and call notifyListeners()',
//         () async {
//       final response =
//           BaseResponse(status: true, data: [ingredientMap1, ingredientMap2]);
//       final mockRequestRepo = MockRequestRepo();
//       when(mockRequestRepo.getIngredient())
//           .thenAnswer((_) => Future.value(response));
//       expect(homeVm.homestate, equals(LoadingState.idle));
//       await homeVm.getIngredients();
//       expect(homeVm.homestate, equals(LoadingState.done));
//       expect(homeVm.ingredients.length, equals(2));
//       expect(homeVm.ingredients[0].name, equals("Egg"));
//       expect(homeVm.ingredients[1].name, equals("Bread"));
//     });
//   });

//   group('homestate', () {
//     test('should return idle when initialized', () {
//       expect(homeVm.homestate, LoadingState.idle);
//     });
//   });

//   group('setHomeState', () {
//     test('should set the homestate value correctly and notify listeners', () {
//       homeVm.setHomeState(LoadingState.loading);
//       expect(homeVm.homestate, LoadingState.loading);

//       homeVm.setHomeState(LoadingState.done);
//       expect(homeVm.homestate, LoadingState.done);

//       homeVm.setHomeState(LoadingState.error);
//       expect(homeVm.homestate, LoadingState.error);
//     });
//   });
}
