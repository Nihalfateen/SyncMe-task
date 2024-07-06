import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/switch_button.dart';
import '../../domain/redeem_points_cubit.dart';

class RedeemPointsWidget extends StatelessWidget {
  RedeemPointsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final redeemPointsCubit = context.watch<RedeemPointsCubit>();

    return Row(
      children: [
        SwitchButton(
            toggle: redeemPointsCubit.toggle,
            onToggle: (value) {
              redeemPointsCubit.toggle = value;
              redeemPointsCubit.setToggleWidget(value);
            }),
        SizedBox(
          width: 10.w,
        ),
        Text(
          "Redeem Punchcard",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 13.sp),
        )
      ],
    );
  }
}
