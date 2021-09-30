import 'package:app_passagens_aereas/modules/home/page/home_page.dart';
import 'package:app_passagens_aereas/modules/login/page/login_page.dart';
import 'package:app_passagens_aereas/modules/onboarding/onboarding_page.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkFirstAcess() async {
    SharedPreferences onboardingPrefs = await SharedPreferences.getInstance();
    bool isFirstAcess =
        (onboardingPrefs.getBool('isFirstAcess') == false ? false : true);

    bool isLogged = onboardingPrefs.getInt('idPassenger') is int;

    onboardingPrefs.setBool('isFirstAcess', false);

    if (!isFirstAcess) {
      if (isLogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              idPassenger: onboardingPrefs.getInt('idPassenger')!,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3500), () {
      checkFirstAcess();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Image.asset(
          ImagesConstants.homeLogo,
        ),
      ),
    );
  }
}
