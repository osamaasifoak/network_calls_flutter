import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';
import 'package:sample_network_calls/constants/styles/font_styles_constants.dart';
class ErrorComponent extends StatelessWidget {
  const ErrorComponent({
    Key? key,
    required this.onTap,
    required this.message,
  }) : super(key: key);
  final void Function() onTap;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _richText(
            message,
            " Retry",
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  RichText _richText(String title, String text, {void Function()? onTap}) {
    return RichText(
      text: TextSpan(
        text: title,
        style: FontStylesConstants.inter(
            color: ColorConstants.mediumGrey,
            fontSize: 13,
            fontWeight: FontWeight.w500),
        children: <TextSpan>[
          TextSpan(
              text: text,
              style: FontStylesConstants.inter(
                  color: ColorConstants.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ],
      ),
    );
  }
}
