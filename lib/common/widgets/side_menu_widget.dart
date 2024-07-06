import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';


import '../../app/modules/home/domain/home_cubit.dart';
import '../../app/modules/home/view/home_view.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/locator_services.dart';
import '../../core/services/preference_services.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SelectedTabBar) {
          homeCubit.updateBackToHome();
        }
      },
      child: NavigationRail(
        selectedIndex: homeCubit.selectedIndex,
        onDestinationSelected: (int index) async {
          Logger()
              .f(GoRouter.of(context).routeInformationProvider.value.uri.path);
          if (index == 2) {
            String? name = Preference.sb.getString(PrefKeys.userName);
        GoRouter.of(context)
                .goNamed(HomeView.route, pathParameters: {"name": name!});
            Preference.sb.clear();
            locator< Preference>().clear();
          }
          Logger().w(homeCubit.backToHome);
          if (homeCubit.backToHome) {
            String? name = Preference.sb.getString(PrefKeys.userName);
            GoRouter.of(context)
                .goNamed(HomeView.route, pathParameters: {"name": name!});
            homeCubit.clearControllers();
          }
          homeCubit.setSelectedTapWidget(index);
        },
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationRailDestination(
            icon: SvgPicture.asset(
              AppImages.points_selected_image,
            ),
            selectedIcon: SvgPicture.asset(
              AppImages.points_unselected_image,
            ),
            label: SizedBox(),
          ),
          NavigationRailDestination(
            padding: EdgeInsets.only(top: 12.h),
            icon: SvgPicture.asset(
              AppImages.settings_icon_unselected,
            ),
            selectedIcon: SvgPicture.asset(
              AppImages.settings_side_menu,
            ),
            indicatorColor: AppColors.buttonBackgroundColor,
            label: SizedBox(),
          ),
          NavigationRailDestination(
            padding: EdgeInsets.only(top: ScreenUtil().screenHeight / 2),
            icon: SvgPicture.asset(
              AppImages.logout_Image,
            ),
            selectedIcon: SvgPicture.asset(
              AppImages.logout_Image,
            ),
            label: SizedBox(),
          ),
        ],
      ),
    );
  }
}
