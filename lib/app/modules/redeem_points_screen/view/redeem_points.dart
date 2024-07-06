import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/app_bar_widget.dart';
import '../../../../common/widgets/empty_state_widget.dart';
import '../../../../common/widgets/flush_bar.dart';
import '../../../../common/widgets/loading_state_widget.dart';
import '../../../../common/widgets/side_menu_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../qr_screen/view/qr_view.dart';
import '../domain/redeem_points_cubit.dart';
import 'widgets/punch_cards_list.dart';
import 'widgets/redeem_switch.dart';
import 'widgets/rewards_list.dart';

class RedeemPointsView extends StatefulWidget {
  const RedeemPointsView({super.key});
  static const route = "/RedeemPointsView";

  @override
  State<RedeemPointsView> createState() => _RedeemPointsViewState();
}

class _RedeemPointsViewState extends State<RedeemPointsView> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    context.read<RedeemPointsCubit>().getRewards();
    context.read<RedeemPointsCubit>().getRedeemProducts();
  }

  @override
  Widget build(BuildContext context) {
    final redeemPointsCubit = context.watch<RedeemPointsCubit>();
    return Scaffold(
      appBar: AppBarWidget(
        isCenter: false,
        isLogin: true,
        name: redeemPointsCubit.name,
      ),
      body: BlocConsumer<RedeemPointsCubit, RedeemPointsState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is RedeemPointsSuccess) {
            GoRouter.of(context).goNamed(QrView.route,
                pathParameters: {"encryptionQr": state.encryptionQr});
            redeemPointsCubit.saveKeyAndEncryption(state.keyQr);
          }
        },
        builder: (context, state) {
          if (state is RewardsLoading) {
            return CustomLoadingWidget();
          }
          if (state is RedeemProductsLoading) {
            return CustomLoadingWidget();
          }
          if (state is RewardsError) {
            return notifyError(context,
                title: state.error ?? "", message: "  ");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: AppColors.borderColor,
              ),
              Expanded(
                child: Row(
                  children: [
                    SideMenuWidget(),
                    VerticalDivider(
                      color: AppColors.borderColor,
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 261.w, right: 369.w, top: 50.h),
                        child: Column(
                          children: [
                            RedeemPointsWidget(),
                            SizedBox(
                              height: 40.h,
                            ),
                            if (redeemPointsCubit.toggle == false) ...[
                              if (state is RewardsEmpty) ...[
                                EmptyStateWidget(
                                    subtitle: Text("The List is Empty",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              color: AppColors.textColor,
                                            )),
                                    title: Text(
                                      "",
                                    ))
                              ] else
                                RewardsList(),
                            ] else if (state is RedeemPointsEmpty) ...[
                              EmptyStateWidget(
                                  subtitle: Text("The List is Empty",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            color: AppColors.textColor,
                                          )),
                                  title: Text(
                                    "",
                                  ))
                            ] else
                              PunchCardsList()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
