import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/app/widgets/custom_animated_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String route_name = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 60),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                               _buildLogo(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 60),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  )),
                              child: Column(
                                children: [
                                  // Text(StorageManager().getBaseUrl()),
                                  const Text(
                                    'You have pushed the button this many times:',
                                  ),
                                  Text(
                                    'counter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }

  Widget _buildLogo() {
    return CustomAnimatedWidgets().fadeSlideIn(
      position: 0,
      verticalOffset: -50,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
             Text('Demo Base Bloc'),
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    return Future.value(true);
  }
}
