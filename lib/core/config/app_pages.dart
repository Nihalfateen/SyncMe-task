// import 'package:get/get.dart';
//
// import '../../app/modules/changePassword/views/change_password_view.dart';
// import '../../app/modules/contactUs/views/contact_us_view.dart';
// import '../../app/modules/cup_detailes/bindings/cup_detailes_binding.dart';
// import '../../app/modules/cup_detailes/views/cup_detailes_view.dart';
// import '../../app/modules/deleteAccount/views/delete_account_view.dart';
// import '../../app/modules/forgetpassword/views/forgetpassword_view.dart';
// import '../../app/modules/history/views/history_view.dart';
// import '../../app/modules/home/views/home_screen.dart';
// import '../../app/modules/newpassword/views/newpassword_view.dart';
// import '../../app/modules/notifaction/views/notifaction_view.dart';
// import '../../app/modules/onboarding/views/onboarding_view.dart';
// import '../../app/modules/otpcode/views/otpcode_view.dart';
// import '../../app/modules/personalInfo/views/personal_info_view.dart';
// import '../../app/modules/privacyStatement/views/privacy_statement_view.dart';
// import '../../app/modules/profile/views/profile_view.dart';
// import '../../app/modules/qr_scan/bindings/qr_scan_binding.dart';
// import '../../app/modules/qr_scan/views/qr_scan_view.dart';
// import '../../app/modules/resetpassword/views/resetpassword_view.dart';
// import '../../app/modules/rewards/views/rewards_view.dart';
// import '../../app/modules/rewards_claim/bindings/rewards_claim_binding.dart';
// import '../../app/modules/rewards_claim/views/rewards_claim_view.dart';
// import '../../app/modules/rewards_detail/views/rewards_detail_view.dart';
// import '../../app/modules/scan/views/scan_view.dart';
// import '../../app/modules/signin/views/signin_view.dart';
// import '../../app/modules/signup/views/login_view.dart';
// import '../../app/modules/splash/views/splash_view.dart';
// import '../../app/modules/stores/views/stores_view.dart';
// import '../../app/modules/termsOfUse/views/terms_of_use_view.dart';
// import '../constants/middleware.dart';
//
// part 'app_routes.dart';
//
// class AppPages {
//   AppPages._();
//
//   static const INITIAL = Routes.SPLASH;
//
//   static final routes = [
//     GetPage(
//       name: _Paths.HOME,
//       page: () => HomeView(),
//       middlewares: [
//         GlobalMiddleware(),
//       ],
//     ),
//     GetPage(
//       name: _Paths.SPLASH,
//       page: () => const SplashView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.ONBOARDING,
//       page: () => const OnboardingView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.SIGNUP,
//       page: () => SignupView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.SIGNIN,
//       page: () => SigninView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.FORGETPASSWORD,
//       page: () => ForgetpasswordView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.OTPCODE,
//       page: () => OtpcodeView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.RESETPASSWORD,
//       page: () => const ResetpasswordView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.NEWPASSWORD,
//       page: () => const NewpasswordView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.PROFILE,
//       page: () => const ProfileView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.PERSONAL_INFO,
//       page: () => PersonalInfoView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.CHANGE_PASSWORD,
//       page: () => ChangePasswordView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.CONTACT_US,
//       page: () => ContactUsView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.TERMS_OF_USE,
//       page: () => const TermsOfUseView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.PRIVACY_STATEMENT,
//       page: () => const PrivacyStatementView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.DELETE_ACCOUNT,
//       page: () => const DeleteAccountView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.HISTORY,
//       page: () => const HistoryView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.SCAN,
//       page: () => const ScanView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//       middlewares: [
//         GlobalMiddleware(),
//       ],
//     ),
//     GetPage(
//       name: _Paths.REWARDS,
//       page: () => const RewardsView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//       middlewares: [
//         GlobalMiddleware(),
//       ],
//     ),
//     GetPage(
//       name: _Paths.STORES,
//       page: () => const StoresView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//       middlewares: [
//         GlobalMiddleware(),
//       ],
//     ),
//     GetPage(
//       name: _Paths.NOTIFACTION,
//       page: () => NotifactionView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.REWARDS_DETAIL,
//       page: () => const RewardsDetailView(),
//       transition: Transition.cupertino,
//       transitionDuration: const Duration(milliseconds: 800),
//     ),
//     GetPage(
//       name: _Paths.REWARDS_CLAIM,
//       page: () => const RewardsClaimView(),
//       binding: RewardsClaimBinding(),
//     ),
//     GetPage(
//       name: _Paths.QR_SCAN,
//       page: () => QRScannerScreen(),
//       binding: QrScanBinding(),
//     ),
//     GetPage(
//       name: _Paths.CUP_DETAILES,
//       page: () => const CupDetailesView(),
//       binding: CupDetailesBinding(),
//     ),
//   ];
// }
