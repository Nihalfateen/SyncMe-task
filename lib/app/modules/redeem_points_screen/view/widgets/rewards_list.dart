import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/widgets/big_button.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../domain/redeem_points_cubit.dart';

class RewardsList extends StatefulWidget {
  const RewardsList({super.key});

  @override
  State<RewardsList> createState() => _RewardsListState();
}

class _RewardsListState extends State<RewardsList> {
  @override
  void initState() {
    // TODO: implement initState

    // context.read<RedeemPointsCubit>().getRewards();
  }

  @override
  Widget build(BuildContext context) {
    final redeemPointsCubit = context.watch<RedeemPointsCubit>();
    return Expanded(
      child: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${redeemPointsCubit.rewardsData[index].imageUrl}',
              placeholder: (context, url) => CircularProgressIndicator(
                color: AppColors.textColor,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "${redeemPointsCubit.rewardsData[index].name}",
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
                  "${redeemPointsCubit.rewardsData[index].pointsCount}",
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
                // navigatorKey.currentState!.context.go(QrView.route);
                redeemPointsCubit.redeemPoints(
                    settingRewardId:
                        redeemPointsCubit.rewardsData[index].settingId,
                    rewardsPoint:
                        redeemPointsCubit.rewardsData[index].pointsCount);
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
        itemCount: redeemPointsCubit.rewardsData.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 36.h,
        ),
      ),
    );
  }
}
