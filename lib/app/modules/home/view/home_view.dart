import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_app/core/constants/app_assets.dart';


import '../../../../common/widgets/app_bar_widget.dart';
import '../../../../common/widgets/big_button.dart';
import '../../../../common/widgets/side_menu_widget.dart';
import '../../../../core/constants/app_colors.dart';

import '../../redeem_points_screen/view/redeem_points.dart';
import '../domain/home_cubit.dart';
import 'widgets/settings_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, });

  static const route = "/HomeView";
  
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
    return Scaffold(
   
     body: SafeArea(
       child: Container(
          
       decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.backgroundImage),fit: BoxFit.cover)
       ),
       child: Center(
         child: Column(
          
          children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor
            ),
            child: Row(
              children: [
                Icon(Icons.abc_rounded)
              ],
            ),
          )
         ],),
       ),
       ),
     )
    );
    
  }
}
