import 'package:app_passagens_aereas/modules/onboarding/widgets/basic_onboarding.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
              ),
              BasicOboarding(
                bannerText: "O melhor preço para sua viagem dos sonhos",
                urlImage: ImagesConstants.onboardingImg2,
              ),
              BasicOboarding(
                bannerText: "Vamos começar",
                urlImage: ImagesConstants.onboardingImg3,
              ),
            ],
            options: CarouselOptions(
                enableInfiniteScroll: false,
                height: constraints.maxHeight,
                viewportFraction: 1,
                autoPlay: false),
          );
        },
      ),
    );
  }
}
