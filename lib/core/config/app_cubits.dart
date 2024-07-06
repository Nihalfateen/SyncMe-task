import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import '../../app/modules/home/data/repo/home_repo.dart';
import '../../app/modules/home/domain/home_cubit.dart';
import '../../app/modules/qr_screen/data/qr_repo.dart';
import '../../app/modules/qr_screen/domain/qr_cubit.dart';
import '../../app/modules/redeem_points_screen/data/repo/redeem_points_repo.dart';
import '../../app/modules/redeem_points_screen/domain/redeem_points_cubit.dart';
import '../../app/modules/splash/domain/cubit/splash_cubit.dart';
import '../services/locator_services.dart';

class AppCubits {
  static List<SingleChildWidget> appCubit() => [

        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(homeRepo: locator<HomeRepo>()),
        ),
       
        BlocProvider<QrCubit>(
          create: (context) => QrCubit(qrRepo: locator<QrRepo>()),
        ),
        BlocProvider<RedeemPointsCubit>(
          create: (context) =>
              RedeemPointsCubit(redeemPointsRepo: locator<RedeemPointsRepo>()),
        ),
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit(),
        ),
      ];
}
