import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../common/widgets/app_bar_widget.dart';
import '../../../../common/widgets/general_dialog.dart';
import '../../../../common/widgets/side_menu_widget.dart';
import '../../home/view/home_view.dart';
import '../../home/view/widgets/settings_widget.dart';
import '../../redeem_points_screen/view/redeem_points.dart';
import '../domain/qr_cubit.dart';

class QrView extends StatefulWidget {
  const QrView({super.key, required this.encryptionQr});
  static const route = "/QrView";
  static const routePath = "/QrView/:encryptionQr";
  static const routeName = "/QrView";
  final String? encryptionQr;

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<QrCubit>().getQrCode();
  }

  @override
  Widget build(BuildContext context) {
    final qrCubit = context.watch<QrCubit>();
    return Scaffold(
      appBar: AppBarWidget(
        isCenter: false,
        isLogin: true,
        name: qrCubit.name,
      ),
      body: BlocConsumer<QrCubit, QrCubitState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is QRCodeError) {
            GeneralDialog.showSuccessDialog(
                dialogText: Text(
              "transaction Transaction time out",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            )).then((value) => GoRouter.of(context).pushNamed(HomeView.route,
                pathParameters: {"name": qrCubit.name!}));
          }
        },
        builder: (context, state) {
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Expanded(
                child: Row(
                  children: [
                    SideMenuWidget(),
                    VerticalDivider(thickness: 1, width: 1),
                    Expanded(
                        flex: 10,
                        child: qrCubit.selectedIndex == true
                            ? SettingsStatusBar()
                            : InkWell(
                                onTap: () => GoRouter.of(context)
                                    .pushNamed(RedeemPointsView.route),
                                child: Center(
                                  child: SizedBox(
                                    height: 400.h,
                                    child: QrImageView(
                                      data: widget.encryptionQr.toString(),
                                      size: 385,
                                    ),
                                  ),
                                ))),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
