import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../common/widgets/big_button.dart';
import '../../../../../common/widgets/flush_bar.dart';
import '../../../../../common/widgets/regular_text_field.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';

import '../../domain/home_cubit.dart';

class SettingsStatusBar extends StatelessWidget {
  const SettingsStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();

    return Padding(
      padding: EdgeInsets.only(left: 261.w, right: 369.w, top: 20.h),
      child: Form(
        key: homeCubit.formKey,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is ProfileUpdateError) {
              notifyError(context, title: state.error ?? "", message: "  ");
            }
            if (state is ProfileUpdateSuccess) {
              notifySuccess(context);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView(
              children: [
                RegularTextField(
                    label: "Full Name",
                    controller: homeCubit.nameController,
                    content:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    mandatory: true,
                    enableBorderColor: AppColors.borderColor,
                    noBorder: false,
                    hintText: "",
                    keyboardType: TextInputType.emailAddress,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors.labelTextColor),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your Name";
                      }
                      return null;
                    }),
                SizedBox(height: 20.h),
                RegularTextField(
                  label: "E-mail address",
                  mandatory: true,
                  controller: homeCubit.emailController,
                  // content: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.labelTextColor),
                  enableBorderColor: AppColors.borderColor,
                  hintText: "",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null && value.trim().isNotEmpty) {
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value.trim())) {
                        return "Enter Valid E-mail";
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                RegularTextField(
                  label: "Current Password",
                  controller: homeCubit.currentPasswordController,
                  content:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  mandatory: true,
                  // protectedText: true,

                  labelStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.labelTextColor),
                  enableBorderColor: AppColors.borderColor,
                  hintText: "",
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter password";
                    } else if (homeCubit.password !=
                        homeCubit.currentPasswordController.text) {
                      return "Incorrect Password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                RegularTextField(
                  label: "New Password",
                  mandatory: true,
                  // protectedText: true,
                  controller: homeCubit.newPasswordController,
                  content:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.labelTextColor),
                  enableBorderColor: AppColors.borderColor,
                  hintText: "",
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                RegularTextField(
                  label: "Confirm New Password",
                  // protectedText: true,
                  controller: homeCubit.confirmPasswordController,
                  mandatory: true,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.labelTextColor),
                  enableBorderColor: AppColors.borderColor,
                  hintText: "",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter password";
                    } else if (homeCubit.confirmPasswordController.text !=
                        homeCubit.newPasswordController.text) {
                      return "Incorrect Password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 31.h),
                BigButton(
                  name: "Save Changes",
                  radius: 8,
                  height: 64.h,
                  containerColor: AppColors.buttonBackgroundColor,
                  width: 0,
                  borderColor: AppColors.buttonBackgroundColor,
                  textColors: AppColors.backgroundColor,
                  
                  onTap: () {
                    if (homeCubit.formKey.currentState!.validate()) {
                      homeCubit.updateProfile();
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
