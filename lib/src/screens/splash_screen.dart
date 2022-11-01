import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenHome extends StatefulWidget {
  const SplashScreenHome({Key? key}) : super(key: key);

  @override
  _SplashScreenHomeState createState() => _SplashScreenHomeState();
}

class _SplashScreenHomeState extends State<SplashScreenHome> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: UserInfoScreen(),
      title: const Text(
        'Please wait...',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      backgroundColor: CustomColors.firebaseNavy,
      loaderColor: Colors.red,
    );
  }
}
