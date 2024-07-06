import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widgets/big_button.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../qr_screen/view/qr_view.dart';
import '../../domain/redeem_points_cubit.dart';

class PunchCardsList extends StatelessWidget {
  const PunchCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    final redeemPointsCubit = context.watch<RedeemPointsCubit>();
    return BlocListener<RedeemPointsCubit, RedeemPointsState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is RedeemPointsSuccess) {
          GoRouter.of(context).goNamed(QrView.route,
              pathParameters: {"encryptionQr": state.encryptionQr});
          redeemPointsCubit.saveKeyAndEncryption(state.keyQr);
        }
      },
      child: Expanded(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
              imageUrl: "${redeemPointsCubit.redeemPointsProductModel[index].simiFilledUrl}",
              placeholder: (context, url) => CircularProgressIndicator(
                color: AppColors.textColor,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
              
              SizedBox(
                height: 18.h,
              ),
              Text(
                "${redeemPointsCubit.redeemPointsProductModel[index].title}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.star_icon),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    "${redeemPointsCubit.redeemPointsProductModel[index].rewardCup}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 13.sp),
                  )
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              BigButton(
                height: 64.h,
                width: 542.w,
                name: 'Redeem Points',
                onTap: () {
                  redeemPointsCubit.redeemPoints(
                      settingPunchId: redeemPointsCubit
                          .redeemPointsProductModel[index].rewardCup,
                      quantityPunch: redeemPointsCubit
                          .redeemPointsProductModel[index].rewardCup);
                },
                containerColor: AppColors.buttonBackgroundColor,
                borderColor: AppColors.buttonBackgroundColor,
                radius: 8,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColors.backgroundColor),
              )
            ],
          ),
          padding: EdgeInsets.only(right: 40.w, bottom: 20.h),
          itemCount: redeemPointsCubit.redeemPointsProductModel.length,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 36.h,
          ),
        ),
      ),
    );
  }
}
