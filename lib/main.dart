import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_cubit.dart';
import 'package:app_passagens_aereas/modules/flight_details/flight_details_cubit/flight_details_cubit.dart';
import 'package:app_passagens_aereas/modules/home/home_cubit.dart/home_cubit.dart';
import 'package:app_passagens_aereas/modules/login/login_cubit/login_cubit.dart';
import 'package:app_passagens_aereas/modules/payment/cubit/payment_cubit.dart';
import 'package:app_passagens_aereas/modules/splash/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

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
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => FlightDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
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
        title: 'Flying Easy',
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
      ),
    );
  }
}
