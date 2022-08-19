import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/home_screen.dart';
import '../screens/splash_screen/controller/splash_cubit.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static final routeNotFoundHandler = Handler(handlerFunc: (context,params) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Route not found"),
          ],
        ),
      ),
    );
  });

  static final rootRoute = AppRoute('/', Handler(handlerFunc: (context, params) {
    return BlocProvider<SplashScreenCubit>(
        create: (context) => SplashScreenCubit(),
        child:  SplashScreen());
  }));

  static final homeRoute = AppRoute(HomeScreen.route_name, Handler(handlerFunc: (context, params) {
    return BlocProvider<SplashScreenCubit>(
        create: (context) => SplashScreenCubit(),
        child:  HomeScreen());
  }));


  static final List<AppRoute> routes = [
    rootRoute,
    homeRoute,
  ];
}
