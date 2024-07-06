import '../../../../common/model/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/dio_services.dart';

class QrRepo {
  final DioServices _dioServices;
  QrRepo(this._dioServices);

  ///qr code
  Future getQrCode(String? key) async {
    try {
      var response =
          await _dioServices.getRequest(AppUrl.checkQr, parms: {"key": key});
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString());
    }
  }
}
