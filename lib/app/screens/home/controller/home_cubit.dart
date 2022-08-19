import 'package:flutter/cupertino.dart';
import 'package:flutter_base_bloc/app/services/appRouter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home_screen.dart';

part 'home_state.dart';

class HomeScreenCubit extends Cubit<HomeState> {
  HomeScreenCubit() : super(HomeInitial());

  // Future loading(BuildContext context) async {
  //   emit(SplashLoading());
  //   Future.delayed(const Duration(seconds: 5), () {
  //     //  _navigateToHome();
  //     AppRouter.pushTo(context, HomeScreen.route_name);
  //
  //   });
  // }
}