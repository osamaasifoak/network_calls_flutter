import 'package:flutter/material.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';
import 'package:sample_network_calls/constants/styles/font_styles_constants.dart';
import 'package:sample_network_calls/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        child: Center(
          child: Text(
            "Network calls\n in flutter",
            textAlign: TextAlign.center,
            style: FontStylesConstants.drukWide(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.3,
                fontSize: 25),
          ),
        ),
      ),
    );
  }
}
