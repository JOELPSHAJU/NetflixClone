import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:netflix/presentation/screen_main_page/screen_mainpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Lottie.asset('assets/lottie/netflix.json')],
          ),
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => MainPage()));
  }
}
