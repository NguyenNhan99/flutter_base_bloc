import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'controller/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  static const String route_name = '/';

   SplashScreen({Key? key}) : super(key: key);

  bool isFirst = false;

  @override
  void initState() {
    // TODO: implement initState

  }

  @override
  Widget build(BuildContext context) {
    if(isFirst == false){
      isFirst = true;
      BlocProvider.of<SplashScreenCubit>(context).loading(context);
    }

    return Scaffold(body: BlocBuilder<SplashScreenCubit, SplashState>(
      builder: (_, state) {
        if (state is SplashLoading) {
          return Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: const SpinKitRipple(
                        color: Colors.lightGreen,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        } else if (state is SplashInitial) {
          return SafeArea(
              child: Container(
            color: Colors.black,
          ));
        } else if (state is SplashLoaded) {
          return SafeArea(
              child: Container(
            color: Colors.yellow,
          ));
        } else {
          return Text((state as SplashError).errorMsg ?? '');
        }
      },
    ));
  }
}
