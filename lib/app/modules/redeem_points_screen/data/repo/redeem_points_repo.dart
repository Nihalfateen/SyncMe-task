

import '../../../../../common/model/failure_model.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_urls.dart';
import '../../../../../core/services/dio_services.dart';
import '../model/redeem_points_products_model.dart';
import '../model/rewards_data_model.dart';

class RedeemPointsRepo {
  final DioServices _dioServices;
  RedeemPointsRepo(this._dioServices);

  /// Redeem Points
  Future redeemPoints(Map<String, dynamic> pointsData) async {
    try {
      var response =
          await _dioServices.postRequest(pointsData, "${AppUrl.addPoints}");
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }

  ///get PunchCards
  Future<List<RedeemPointsProductsModel>> getProducts() async {
    try {
      var response = await _dioServices.getRequest(AppUrl.getPunchCards,
          parms: {
            "sortDirection": 0,
            "statusId": statusId,
            "brandId": brandId
          });
      List<RedeemPointsProductsModel> products =
          List<RedeemPointsProductsModel>.from((response["data"])
              .map((x) => RedeemPointsProductsModel.fromJson(x))).toList();
      return products;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }

  ///get Rewards
  Future<List<RewardsData>> getRewards() async {
    try {
      var response = await _dioServices.getRequest(AppUrl.getRewards, parms: {
        "id": 1,
      });
      List<RewardsData> rewards = List<RewardsData>.from(
          (response["data"]).map((x) => RewardsData.fromJson(x))).toList();
      return rewards;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }
}
