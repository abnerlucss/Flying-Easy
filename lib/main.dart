import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_cubit.dart';
import 'package:app_passagens_aereas/modules/login/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'modules/onboarding/onboarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1F2A36),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateAccountCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp(
        builder: (context, widget) {
          print(MediaQuery.of(context).size.width);

          return ResponsiveWrapper.builder(
            widget,
            maxWidth: 1200,
            minWidth: 400,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.autoScale(400, name: MOBILE),
            ],
          );
        },
        title: 'Passagens Aéreas',
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primarySwatch: Colors.blue,
        ),
        home: OnboardingPage(),
      ),
    );
  }
}
