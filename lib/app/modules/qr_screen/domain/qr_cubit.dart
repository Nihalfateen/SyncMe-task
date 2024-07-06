import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_app/core/extensions/task_excuter.dart';


import '../../../../common/widgets/general_dialog.dart';
import '../../../../core/config/app_route.dart';
import '../../../../core/services/preference_services.dart';
import '../../home/view/home_view.dart';
import '../data/qr_repo.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrCubitState> {
  QrCubit({required this.qrRepo}) : super(QrCubitInitial());
  final name = Preference.sb.getString(PrefKeys.userName);
  final QrRepo qrRepo;

  ///Qr Code
  Future<void> getQrCode() async {
    String? qrKey = await Preference.sb.getString(PrefKeys.keyQr);
    emit(QRCodeLoading());
    var response = qrRepo.getQrCode(qrKey);
    await response.execute(
      onFailed: (failed) {
        emit(QRCodeError());
      },
      onSuccess: (value) async {
        if (value["success"] == true) {
          navigatorKey.currentState!.context
              .pushNamed(HomeView.route, pathParameters: {"name": name!}).then(
                  (value) => GeneralDialog.showSuccessDialog(
                          dialogText: Text(
                        "transaction done",
                        style: Theme.of(navigatorKey.currentContext!)
                            .textTheme
                            .displayMedium,
                        textAlign: TextAlign.center,
                      )));
        }

        emit(QRCodeSuccess());
      },
    );
  }

  bool selectedIndex = false;
  void setSelectedTapWidget() {
    selectedIndex = !selectedIndex;
    emit(SelectedTabBar());
  }
}
