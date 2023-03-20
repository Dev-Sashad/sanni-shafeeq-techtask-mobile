import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/model/base_response.dart';
import 'package:tech_task/data/network_request.dart';

abstract class RequestRepo {
  Future<BaseResponse> getIngredient();
  Future<BaseResponse> getReceipe({required String query});
}

class RequestRepoImpl extends RequestRepo {
  final NetworkService _networkService;
  RequestRepoImpl(
    this._networkService,
  );

  // Function to get ingredients
  @override
  Future<BaseResponse> getIngredient() async {
    try {
      final result = await _networkService.call(
          path: AppEndpoint.getIngredients,
          method: RequestMethod.get,
          body: {});
      if (result.status.toLowerCase() != "success") {
        appPrint('the error is ${result.status}');
        return BaseResponse(
            status: false, message: result.message, title: result.status);
      } else {
        appPrint('the result is ${result.data}');
        return BaseResponse(
            status: true,
            message: result.message,
            title: result.status,
            data: result.data);
      }
    } catch (e) {
      appPrint(e);
      return BaseResponse(
          status: false, message: "An error occured", title: "Error");
    }
  }

  // Function to get recipes
  @override
  Future<BaseResponse> getReceipe({required String query}) async {
    try {
      final result = await _networkService.call(
          path: AppEndpoint.getRecipes,
          method: RequestMethod.get,
          body: {},
          queryParams: {"ingredients": query});
      if (result.status.toLowerCase() != "success") {
        appPrint('the error is ${result.status}');
        return BaseResponse(
            status: false, message: result.message, title: result.status);
      } else {
        appPrint('the result is ${result.data}');
        return BaseResponse(
            status: true,
            message: result.message,
            title: result.status,
            data: result.data);
      }
    } catch (e) {
      appPrint(e);
      return BaseResponse(
          status: false, message: "An error occured", title: "Error");
    }
  }
}
