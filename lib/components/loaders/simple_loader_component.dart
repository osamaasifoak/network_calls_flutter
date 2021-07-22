import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';

class SimpleLoaderComponent extends StatelessWidget {
  const SimpleLoaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: ColorConstants.primary,
        size: 40,
        itemCount: 6,
        duration: Duration(milliseconds: 700),
      ),
    );
  }
}
