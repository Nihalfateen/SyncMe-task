import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:sync_app/core/extensions/task_excuter.dart';


import '../../../../core/constants/app_strings.dart';
import '../../../../core/services/preference_services.dart';
import '../data/model/redeem_points_model.dart';
import '../data/model/redeem_points_products_model.dart';
import '../data/model/rewards_data_model.dart';
import '../data/repo/redeem_points_repo.dart';

part 'redeem_points_state.dart';

class RedeemPointsCubit extends Cubit<RedeemPointsState> {
  RedeemPointsCubit({required this.redeemPointsRepo})
      : super(RedeemPointsInitial());
  bool selectedIndex = false;
  final RedeemPointsRepo redeemPointsRepo;
  List<RedeemPointsProductsModel> redeemPointsProductModel = [];
  List<RewardsData> rewardsData = [];
  final name = Preference.sb.getString(PrefKeys.userName);
  bool toggle = false;
  void setSelectedTapWidget() {
    selectedIndex = !selectedIndex;
    emit(SelectedTabBar());
  }

  void setToggleWidget(bool isToggled) {
    isToggled = !isToggled;
    emit(SelectedSwitch());
  }

  Future<void> getRedeemProducts() async {
    emit(RedeemProductsLoading());
    var response = redeemPointsRepo.getProducts();
    await response.execute(
      onFailed: (failed) {
        emit(RedeemProductsError());
        Logger().i(failed.message);
      },
      onSuccess: (value) async {
        redeemPointsProductModel = value;
        if (redeemPointsProductModel.isEmpty) {
          emit(RedeemPointsEmpty());
          return;
        } else {
          redeemPointsProductModel = value;
        }

        emit(RedeemProductsSuccess());
      },
    );
  }

  ///get Rewards
  Future<void> getRewards() async {
    emit(RewardsLoading());
    var response = redeemPointsRepo.getRewards();
    await response.execute(onFailed: (failed) {
      emit(RewardsError(error: failed.message));
      Logger().i(failed.message);
    }, onSuccess: (value) {
      rewardsData = value;
      if (rewardsData.isEmpty) {
        emit(RewardsEmpty());
        return;
      } else {
        rewardsData = value;
      }
      emit(RewardsSuccess());
    });
  }

  ///redeem Points
  Future<void> redeemPoints(
      {int? rewardsPoint,
      int? settingRewardId,
      int? settingPunchId,
      int? quantityPunch}) async {
    String? cashierId = await Preference.sb.getString(PrefKeys.userId);

    emit(RedeemPointsLoading());

    var response = redeemPointsRepo.redeemPoints(RedeemPointsModel(
            id: 0,
            userId: Id,
            typeId: 2,
            cashierId: cashierId,
            invoiceImage: "invoiceImage.jpg",
            orderNumber: orderNumber,
            transactionTime: "2024-03-09T10:50:41.110Z",
            amount: toggle == false ? rewardsPoint : quantityPunch,
            statusId: statusId,
            settingId: toggle == false ? settingRewardId : settingPunchId,
            brandId: brandId,
            money: 0)
        .toJson());

    await response.execute(
      onFailed: (failed) {
        emit(RedeemPointsError());
      },
      onSuccess: (value) async {
        emit(RedeemPointsSuccess(
            encryptionQr: value["data"]["encryptTransaction"],
            keyQr: value["data"]["key"]));
      },
    );
  }

  void saveKeyAndEncryption(String keyQr) async {
    await Preference.sb.setString(PrefKeys.keyQr, keyQr);
  }
}
