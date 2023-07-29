import 'package:dartz/dartz.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/core/data/models/common_response.dart';
import 'package:meal_monkey/core/data/network/endpoints/meal_endpoints.dart';
import 'package:meal_monkey/core/data/network/network_config.dart';
import 'package:meal_monkey/core/enums/request_type.dart';
import 'package:meal_monkey/core/utils/network_utils.dart';

class MealRepository {
  Future<Either<String, List<MealModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: MealEndpoints.getAll,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.GET,
        ),
      ).then(
        (response) {
          CommonResponseModel<List<dynamic>> commonResponse =
              CommonResponseModel.fromJson(response);
          if (commonResponse.getStatus) {
            List<MealModel> resultList = [];

            commonResponse.data!.forEach(
              (element) {
                resultList.add(MealModel.fromJson(element));
              },
            );

            return Right(resultList);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
