import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.backgroundColor = Colors.white,
    this.name,
    this.elevation = .5,
    this.isCenter = true,
    this.backButtonColor,
    this.isLogin = false,
    this.style,
    this.actions,
  }) : super(key: key);
  final Color backgroundColor;
  final String? name;
  final double elevation;
  final bool isLogin, isCenter;
  final Color? backButtonColor;
  final TextStyle? style;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: true,
      titleSpacing: 22.w,
      title: Text("GitHub Repo.",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight:FontWeight.bold),),
      leadingWidth: 0,
    
      leading: SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
