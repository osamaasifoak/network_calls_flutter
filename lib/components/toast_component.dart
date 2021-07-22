import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';


class ToastComponent {
  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstants.black.withOpacity(0.8),
        textColor: ColorConstants.white,
        fontSize: 16.0);
  }
}
