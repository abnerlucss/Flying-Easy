import 'package:app_passagens_aereas/modules/home/page/home_page.dart';
import 'package:app_passagens_aereas/modules/login/page/login_page.dart';
import 'package:app_passagens_aereas/modules/onboarding/widgets/basic_onboarding.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/steps_widget.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/white_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return CarouselSlider(
            items: [
              BasicOboarding(
                bannerText: "Passagens aéreas na palma de sua mão",
                urlImage: ImagesConstants.onboardingImg1,
                steps: StepsWidget(
                  currentStep: 1,
                  numberOfSteps: 3,
                ),
              ),
              BasicOboarding(
                bannerText: "O melhor preço para sua viagem dos sonhos",
                urlImage: ImagesConstants.onboardingImg2,
                steps: StepsWidget(
                  currentStep: 2,
                  numberOfSteps: 3,
                ),
              ),
              BasicOboarding(
                bannerText: "Vamos começar",
                urlImage: ImagesConstants.onboardingImg3,
                whiteButton: WhiteButton(
                  buttonText: "Começar",
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: constraints.maxHeight,
              viewportFraction: 1,
              autoPlay: false,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }
}
