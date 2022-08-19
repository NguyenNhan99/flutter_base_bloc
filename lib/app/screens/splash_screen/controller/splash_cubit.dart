
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_bloc/app/services/appRouter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home_screen.dart';

part 'splash_state.dart';

class SplashScreenCubit extends Cubit<SplashState> {
  SplashScreenCubit() : super(SplashInitial());

  Future loading(BuildContext context) async {
    emit(SplashLoading());
    Future.delayed(const Duration(seconds: 5), () {
    //  _navigateToHome();
      AppRouter.pushTo(context, HomeScreen.route_name,isRemoveUntil: true);

    });
  }
}