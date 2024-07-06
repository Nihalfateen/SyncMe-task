import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

import '../../core/config/app_route.dart';

import '../../core/constants/app_colors.dart';

class GeneralDialog {
  static Future<bool> showSuccessDialog(
      {required Widget dialogText, bool? canCloseDialog}) async {
    Future.delayed(const Duration(seconds: 1), () {
      GoRouter.of(navigatorKey.currentContext!).pop();
    });
    bool? result = await showDialog(
      barrierDismissible: canCloseDialog ?? false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.buttonBackgroundColor,
          icon: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => navigatorKey.currentState!.pop(),
                child: Icon(
                  Icons.clear,
                  color: AppColors.buttonBackgroundColor,
                ),
              )),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16.h,
              ),
              dialogText
            ],
          ),
          elevation: 0,
        );
      },
    );

    return result ?? false;
  }

  static Future<bool> showDeleteDialog(
      {required Widget dialogText,
      required Widget dialogButton,
      Widget? dialogTextSubtitle,
      bool? canCloseDialog}) async {
    bool? result = await showDialog(
      barrierDismissible: canCloseDialog ?? false,
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        // insetPadding: EdgeInsets.all(32),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                dialogText,
                const Spacer(),
                IconButton(
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                    },
                    icon: const Icon(Icons.clear))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            if (dialogTextSubtitle != null) dialogTextSubtitle,
            SizedBox(
              height: 20.h,
            ),
            dialogButton
          ],
        ),
        elevation: 0,
      ),
    );
    return result ?? false;
  }
}
