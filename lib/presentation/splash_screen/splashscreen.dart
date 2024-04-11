import 'package:flutter/material.dart';

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
            children: [
              Image.asset(
                'assets/Images/NetflixLogo.png',
                width: size.width * 3,
                height: size.height * .2,
              ),
              Image.asset(
                'assets/Images/toppng.com-netflix-logo-png-download-1280x544.png',
                width: size.width * 3,
                height: size.height * .1,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '- JOEL P SHAJU -',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => MainPage()));
  }
}
