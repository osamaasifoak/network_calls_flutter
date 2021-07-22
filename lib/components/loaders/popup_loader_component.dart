import 'package:flutter/material.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PopupLoader {
  static showLoadingDialog(context) {
    showDialog(
        context: context,
        // barrierDismissible: false,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Center(
            child: SpinKitWave(
              color: ColorConstants.primary,
              size: 40,
              itemCount: 6,
              duration: Duration(milliseconds: 700),
            ),
          );
        });
  }

  static hideLoadingDialog(context) {
    Navigator.pop(context);
  }
}
