import 'package:get_it/get_it.dart';

import '../../app/modules/home/data/repo/home_repo.dart';
import '../../app/modules/qr_screen/data/qr_repo.dart';
import '../../app/modules/redeem_points_screen/data/repo/redeem_points_repo.dart';
import 'dio_services.dart';
import 'preference_services.dart';



final locator = GetIt.instance;

///how to take object from class in service locator
/// Repo repo = locator<Repo>();
void setupLocator() {
  locator.registerLazySingleton(() => Preference());
  locator.registerLazySingleton(() => DioServices());
  locator.registerLazySingleton(() => HomeRepo(locator<DioServices>()));
  locator.registerLazySingleton(() => QrRepo(locator<DioServices>()));
  locator.registerLazySingleton(() => RedeemPointsRepo(locator<DioServices>()));
}
