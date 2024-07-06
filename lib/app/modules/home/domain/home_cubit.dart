import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sync_app/core/extensions/task_excuter.dart';


import '../../../../core/config/app_route.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/services/preference_services.dart';
import '../data/model/update_model.dart';
import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;
  int selectedIndex = 0;
  bool backToHome = false;
  final name = Preference.sb.getString(PrefKeys.userName);
  final password = Preference.sb.getString(PrefKeys.userPassword);

  String? errorMessage;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  void setSelectedTapWidget(int index) {
    selectedIndex = index;
    emit(SelectedTabBar());
  }

  void updateBackToHome() {
    backToHome = true;
    emit(BackHome());
  }

  Future<void> updateProfile() async {
    final userId = Preference.sb.getString(PrefKeys.userId);
    emit(ProfileLoading());
    UpdateModel? updateModel = UpdateModel(
        id: userId ?? "",
        email: emailController.text.trim().isEmpty
            ? null
            : emailController.text.trim(),
        password: newPasswordController.text.isEmpty
            ? null
            : newPasswordController.text,
        oldPassword: currentPasswordController.text.isEmpty
            ? null
            : currentPasswordController.text,
        fullName: nameController.text,
        lastName: nameController.text,
        firstName: nameController.text,
        loginCount: 0,
        gender: gender,
        brandId: brandId,
        statusId: statusId);
    var response = homeRepo.updateProfile(updateModel);
    await response.execute(
      onFailed: (failed) {
        errorMessage = failed.message;
        emit(ProfileUpdateError(error: failed.message));
      },
      onSuccess: (value) async {
        emit(ProfileUpdateSuccess());
        navigatorKey.currentState!.context.pop();
        clearControllers();
      },
    );
  }

  void clearControllers() {
    emailController.clear();
    confirmPasswordController.clear();
    currentPasswordController.clear();
    newPasswordController.clear();
    nameController.clear();
  }

  ///Points Settings
  Future<void> getPointsSettings() async {
    emit(PointsSettingsLoading());
    var response = homeRepo.getPointSettings();
    await response.execute(
      onFailed: (failed) {
        emit(PointsSettingsError());
      },
      onSuccess: (value) async {
        savegainPointsAndRedeemPoints(value["data"]["gainFactor"].toString(), value["data"]["redeemFactor"].toString(),value["data"]["settingId"].toString());
        emit(PointsSettingsDone(
           gainFactor:  value["data"]["gainFactor"].toString(),
           redeemFactor:  value["data"]["redeemFactor"].toString(),
           settingsId:  value["data"]["settingId"].toString())
           );
           
      },
    );
  }

  void savegainPointsAndRedeemPoints(
      String gainFactor, String redeemFactor, String settingsId) async {
    await Preference.sb.setString(PrefKeys.gainFactor, gainFactor);
    await Preference.sb.setString(PrefKeys.redeemFactor, redeemFactor);
    await Preference.sb.setString(PrefKeys.settingsId, settingsId);
  }
}
