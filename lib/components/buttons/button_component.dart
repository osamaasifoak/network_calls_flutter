import 'package:flutter/material.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';
import 'package:sample_network_calls/constants/strings/font_family_constants.dart';

class ButtonComponent extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final double border;
  final double btnHeight;
  final Color? color;
  final TextStyle? textStyle;
  final bool? isDisabled;
  const ButtonComponent(
      {Key? key,
      this.onPressed,
      this.buttonText = '',
      this.border = 0.0,
      this.color = ColorConstants.primary,
      this.textStyle,
      this.btnHeight = 48,
      this.isDisabled = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border),
        ),
        backgroundColor: isDisabled! ? ColorConstants.mediumGrey : color,
        minimumSize: Size(MediaQuery.of(context).size.width, btnHeight),
      ),
      child: Text(
        buttonText,
        style: textStyle != null
            ? textStyle
            : TextStyle(
                color: ColorConstants.white,
                fontFamily: FontFamilyConstants.ProximaNova,
                fontWeight: FontWeight.w800),
      ),
      onPressed:
          isDisabled! ? null : (onPressed != null ? onPressed : () => {}),
    );
  }
}
