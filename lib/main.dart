import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import 'core/config/app_cubits.dart';
import 'core/config/app_route.dart';
import 'core/config/app_theme.dart';
import 'core/config/observer.dart';
import 'core/constants/app_flavors.dart';
import 'core/services/locator_services.dart';
import 'core/services/preference_services.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  await Preference.init();
  setupLocator();
  Bloc.observer = AppBlocObserver();


  runSync();
}

void runSync() {
  final app = MultiBlocProvider(
      providers: AppCubits.appCubit(),
      child: MyApp());
  // ),
  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1280, 800),
        builder: (BuildContext context, Widget? child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp.router(
              routerConfig: AppRouter.route,
              theme: AppTheme.appTheme,
              title: 'GitHub Repo',
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.noScaling,
                  ),
                  child: child!,
                );
              },
            ),
          );
        });
  }
}
