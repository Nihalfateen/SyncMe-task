

import '../../../../../common/model/failure_model.dart';
import '../../../../../core/constants/app_urls.dart';
import '../../../../../core/services/dio_services.dart';
import '../model/update_model.dart';

class HomeRepo {
  final DioServices _dioServices;
  HomeRepo(this._dioServices);

  /// UpdateProfile
  Future updateProfile(UpdateModel updateModel) async {
    try {
      var response = await _dioServices.putRequest(
          updateModel.toJson(), "${AppUrl.updateUser}");
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }

  ///point settings
  Future getPointSettings() async {
    try {
      var response = await _dioServices
          .getRequest(AppUrl.getPointSettings, parms: {"id": 1});
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }
}
