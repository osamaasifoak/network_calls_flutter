import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';
import 'package:sample_network_calls/provider_initialize_list.dart';
import 'package:sample_network_calls/routes/app_routes.dart';
import 'package:sample_network_calls/screens/splash_screen.dart';
import 'package:sample_network_calls/services/navigation_services.dart';
import 'package:sample_network_calls/services/networks/dio_client_network.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDepedencies();
  await serviceLocatorInstance<DioClientNetwork>().initializeDioClientNetwork();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

final bool isIOs = Platform.isIOS ? true : false;
final serviceLocatorInstance = GetIt.instance;
void setupDepedencies() {
  serviceLocatorInstance
      .registerSingleton<DioClientNetwork>(DioClientNetwork());
  serviceLocatorInstance.registerLazySingleton(() => NavigationService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersList(context),
      child: MaterialApp(
        navigatorKey: serviceLocatorInstance<NavigationService>().navigatorKey,
        title: 'Network calls',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: ColorConstants.kPrimaryColor,
          textTheme: buildTextTheme(),
          buttonTheme: ButtonThemeData(
            buttonColor: ColorConstants.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onGenerateRoute: (RouteSettings settings) {
          return onGenerateRoutes(settings);
        },
        home: SplashScreen(),
      ),
    );
  }

  TextTheme buildTextTheme() {
    return TextTheme(
      headline1: GoogleFonts.sourceSansPro(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
          color: ColorConstants.primary),
      headline6: GoogleFonts.sourceSansPro(
          fontSize: 25.0,
          fontStyle: FontStyle.normal,
          color: ColorConstants.primary),
      bodyText2: GoogleFonts.sourceSansPro(
          fontSize: 14.0, color: ColorConstants.primary),
      bodyText1: GoogleFonts.sourceSansPro(
          fontSize: 16.0, color: ColorConstants.primary),
      caption: GoogleFonts.sourceSansPro(
        fontSize: 11.0,
      ),
      button: GoogleFonts.sourceSansPro(
          fontSize: 16.0,
          color: ColorConstants.primary,
          letterSpacing: 1.4,
          fontWeight: FontWeight.w600),
    );
  }
}
