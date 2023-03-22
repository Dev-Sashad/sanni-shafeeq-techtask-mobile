import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/model/ingredients_model.dart';
import 'package:tech_task/core/model/recipes_model.dart';
import 'package:tech_task/core/repository/request_repo.dart';
import 'package:tech_task/utils/helpers/time_utils.dart';

class HomeVm extends BaseModel {
  final RequestRepo _requestRepo;
  final Ref _ref;
  HomeVm(this._ref, this._requestRepo) {
    initGreeting();
    initLunchValue();
  }

  // State of the app to determine the interface a user would see
  //based on the state
  LoadingState _homeState = LoadingState.idle;
  LoadingState get homestate => _homeState;
  setHomeState(LoadingState value) {
    _homeState = value;
    notifyListeners();
  }

  // Array of ingredients after api call
  List<IngredientModel> _ingredients = [];
  List<IngredientModel> get ingredients => _ingredients;

  // this is a welcome message;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // this is a welcome message;
  String _greeting = '';
  String get greeting => _greeting;

  DateTime _lunchDate = DateTime.now();
  DateTime get lunchDate => _lunchDate;

  // the selected lunch date equivalence in string
  String _lunchValue = "Today";
  String get lunchValue => _lunchValue;

  initLunchValue() {
    if (Jiffy(_lunchDate.toString()).isToday) {
      _lunchValue = "Today";
    } else if (Jiffy(_lunchDate.toString()).isTomorrow) {
      _lunchValue = "Tomorrow";
    } else {
      _lunchValue = formatDayDateMonth(_lunchDate);
    }
    notifyListeners();
  }

  //Update the desired lunch date
  setLunchDate(DateTime value) {
    _lunchDate = value;
    notifyListeners();
    initLunchValue();
    _ref.read(queryIngredients.notifier).state.clear();
  }

  //addin or removing itmes from query list
  addtoQueryList(String value) {
    if (_ref.read(queryIngredients.state).state.contains(value)) {
      _ref.read(queryIngredients.notifier).state.remove(value);
    } else {
      _ref.read(queryIngredients.notifier).state.add(value);
    }
    notifyListeners();
  }

  // initializing welcome message value based on time of day
  initGreeting() {
    if (TimeOfDay.now().hour >= 0 && DateTime.now().hour < 12) {
      _greeting = "Good Morning";
    } else if (DateTime.now().hour >= 12 && DateTime.now().hour < 19) {
      _greeting = "Good Afternoon";
    } else {
      _greeting = "Good Evening";
    }
    notifyListeners();
  }

  // get Items in my fridge
  getIngredients() async {
    try {
      setHomeState(LoadingState.loading);
      final response = await _requestRepo.getIngredient();
      if (response.status!) {
        List<IngredientModel> data = (response.data as List).isNotEmpty
            ? (response.data as List)
                .map((e) => IngredientModel.fromJson(e))
                .toList()
            : [];
        _ingredients = data;
        notifyListeners();
        setHomeState(LoadingState.done);
      } else {
        setHomeState(LoadingState.error);
        _errorMessage = response.message ?? "";
      }
    } catch (e) {
      setHomeState(LoadingState.error);
      _errorMessage = AppStrings.tryAgainText;
      notifyListeners();
    }
  }

  //Suggest lunch from selected ingredents
  Future<bool> suggestLunch() async {
    try {
      setLoading(LoadingState.loading);
      String query = _ref.read(queryIngredients.state).state.join(',');
      final response = await _requestRepo.getReceipe(query: query);
      if (response.status!) {
        List<RecipesModel> data = (response.data as List).isNotEmpty
            ? (response.data as List)
                .map((e) => RecipesModel.fromJson(e))
                .toList()
            : [];
        _ref.read(queryresult.notifier).state = data;
        notifyListeners();
        if (data.isNotEmpty) {
          setLoading(LoadingState.done);
          return response.status!;
        } else {
          setLoading(LoadingState.error);
          showOkayDialog(
              icon: Icons.close,
              iconBorderColor: Colors.red,
              title: AppStrings.errorTitle,
              message: AppStrings.noSuggestedLunchText);
          return false;
        }
      } else {
        setLoading(LoadingState.error);
        showOkayDialog(
            icon: Icons.close,
            iconBorderColor: Colors.red,
            title: response.title!,
            message: response.message!);
        return response.status!;
      }
    } catch (e) {
      setLoading(LoadingState.error);
      showOkayDialog(
          icon: Icons.close,
          iconBorderColor: Colors.red,
          title: AppStrings.errorTitle,
          message: AppStrings.tryAgainText);
      return false;
    }
  }
}

final homeVm = ChangeNotifierProvider<HomeVm>(
  (ref) => HomeVm(ref, locator<RequestRepo>()),
);

// the query result is the response after calling get recipes
final queryresult = StateProvider<List<RecipesModel>>((ref) => []);

// Query ingredients are the array of selected times from the fridge
final queryIngredients = StateProvider<List<String>>((ref) => []);
