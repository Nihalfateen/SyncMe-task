import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';


import '../../../../../core/config/app_route.dart';
import '../../../../../core/services/preference_services.dart';
import '../../../home/view/home_view.dart';


part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  void checkAuth() async {
   
      String? name = Preference.sb.getString(PrefKeys.userName);
      navigatorKey.currentState!.context
          .goNamed(HomeView.route, pathParameters: {"name": name!});
      return;
   

    
  }
}
