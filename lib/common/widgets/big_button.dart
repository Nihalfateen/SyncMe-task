import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sync_app/common/widgets/loading_widget.dart';


class BigButton extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Function onTap;
  final Color containerColor;
  final Color borderColor;
  final double radius;
  final Color? textColors;
  final Widget? widget;
  final bool? loading;
  final TextAlign? textAlign;
  final Color? smallTextColors;
  final TextStyle? style;
  const BigButton(
      {required this.height,
      required this.width,
      required this.name,
      required this.onTap,
      required this.containerColor,
      required this.borderColor,
      required this.radius,
      this.textColors,
      this.widget,
      this.loading,
      this.textAlign,
      this.smallTextColors,
      this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (loading == true) {
          return;
        }
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(top: 16.h, bottom: 18.h),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(radius.r),
            border: Border.all(color: borderColor, width: 0.8)),
        child: widget ??
            Center(
              child: loading == true
                  ? const LoadingWidget()
                  : Text(
                      name,
                      textScaleFactor: .9,
                      style: style ??
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: textColors,
                              fontWeight: FontWeight.w500,
                              fontSize: 23.sp),
                      textAlign: textAlign,
                    ),
            ),
      ),
    );
  }
}
