import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../core/constants/app_colors.dart';

class SwitchButton extends StatelessWidget {
  SwitchButton({super.key, required this.toggle, required this.onToggle});
  bool toggle = false;
  final void Function(bool) onToggle;
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      height: 20.h,
      width: 37.w,
      padding: 0,
      toggleSize: 16.0,
      borderRadius: 10.0,
      activeColor: AppColors.buttonBackgroundColor,
      value: toggle,
      onToggle: onToggle,
    );
  }
}
