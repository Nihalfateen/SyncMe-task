// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:perkfy/core/constants/app_assets.dart';
//
// class MainScreenNavBarWidget extends StatelessWidget {
//   const MainScreenNavBarWidget(
//       {super.key, required this.index, required this.navigationShell});
//
//   final int index;
//   final StatefulNavigationShell navigationShell;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: AppColors.primaryColor,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const Spacer(),
//           navBarItem(
//             context: context,
//             naviIndex: index,
//             itemIndex: 3,
//             activeLabel: "Home",
//             icon: SvgPicture.asset(
//               AppImages.homeIcon,
//             ),
//             activeIcon: SvgPicture.asset(
//               AppImages.homeSelectIcon,
//             ),
//           ),
//           const Spacer(),
//           navBarItem(
//             context: context,
//             naviIndex: index,
//             itemIndex: 2,
//             activeLabel: "Scan",
//             icon: SvgPicture.asset(
//               AppImages.scanIcon,
//             ),
//             activeIcon: SvgPicture.asset(
//               AppImages.scanSelectIcon,
//             ),
//           ),
//           const Spacer(
//             flex: 3,
//           ),
//           navBarItem(
//             context: context,
//             naviIndex: index,
//             itemIndex: 1,
//             activeLabel: "Rewards",
//             icon: SvgPicture.asset(
//               AppImages.rewardIcon,
//             ),
//             activeIcon: SvgPicture.asset(
//               AppImages.rewardSelectIcon,
//             ),
//           ),
//           const Spacer(),
//           navBarItem(
//             context: context,
//             naviIndex: index,
//             itemIndex: 0,
//             activeLabel: "Store",
//             icon: SvgPicture.asset(
//               AppImages.storeIcon,
//             ),
//             activeIcon: SvgPicture.asset(
//               AppImages.storeSelectIcon,
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
//
//   Widget navBarItem({
//     required BuildContext context,
//     required int itemIndex,
//     required int naviIndex,
//     required Widget activeIcon,
//     required String activeLabel,
//     required Widget icon,
//     final VoidCallback? onTap,
//   }) {
//     final selected = itemIndex == naviIndex;
//     return InkResponse(
//       onTap: () {
//         navigationShell.goBranch(
//           itemIndex,
//           // A common pattern when using bottom navigation bars is to support
//           // navigating to the initial location when tapping the item that is
//           // already active. This example demonstrates how to support this behavior,
//           // using the initialLocation parameter of goBranch.
//           // initialLocation: itemIndex == navigationShell.currentIndex,
//         );
//       },
//       child: AnimatedContainer(
//         key: Key(activeLabel),
//         height: ScreenUtil().screenHeight / 10,
//         duration: const Duration(milliseconds: 400),
//         padding: EdgeInsets.only(bottom: 25.h),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 10.h,
//             ),
//             selected ? activeIcon : icon,
//           ],
//         ),
//       ),
//     );
//   }
// }
