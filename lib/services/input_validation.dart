// import 'package:workerapp_buttler/constants/strings/error_messages.dart';
// import 'package:workerapp_buttler/constants/strings/string_constants.dart';
// import 'package:email_validator/email_validator.dart';

// class InputValidation {
//   static const PatternPhone = r'^(?:[0]9)?[0-9]{11}$';
//   static const Pattern passwordMinLen8withLowerCaseAndSpecialChar =
//       r'^((?=.*\d)(?=.*[a-z])(?=.*[\W_]).{8,20})';

//   static bool isEmailValid(String email) {
//     return EmailValidator.validate(email);
//   }

//   static bool _isPhoneValid(String phone) {
//     RegExp regexPhone = new RegExp(PatternPhone);
//     return regexPhone.hasMatch(phone);
//   }

//   static isPasswordValid(String password, String pattern) {
//     RegExp regexPassword = new RegExp(pattern);
//     return regexPassword.hasMatch(password);
//   }

//   static String validatePhone(String phone, {String errorMessage}) {
//     if (phone.isEmpty) {
//       return StringConstant.errEmpty;
//     } else if (_isPhoneValid(phone)) {
//       return null;
//     } else {
//       return errorMessage == null ? StringConstant.errPhone : errorMessage;
//     }
//   }

//   static String validateFieldLength(String input, int length,
//       {String errorMessage}) {
//     if (input.isEmpty) {
//       return errorMessage == null ? ErrorMessages.errEmpty : errorMessage;
//     } else if (input.length < length) {
//       return errorMessage == null
//           ? "${ErrorMessages.errMinLength} $length Characters"
//           : errorMessage;
//     } else {
//       return null;
//     }
//   }

//   static String validateEmail(String email, {String errorMessage}) {
//     if (email.isEmpty) {
//       return StringConstant.errEmpty;
//     } else if (isEmailValid(email)) {
//       return null;
//     } else {
//       return errorMessage == null ? StringConstant.errEmail : errorMessage;
//     }
//   }

//   static String validateFieldEmpty(String input, {String errorMessage}) {
//     if (input.isEmpty) {
//       return errorMessage == null ? StringConstant.errEmpty : errorMessage;
//     } else {
//       return null;
//     }
//   }

//   static String validatePassword(String password, {String errorMessage}) {
//     if (password.isEmpty) {
//       return StringConstant.errEmpty;
//     } else if (isPasswordValid(
//         password, passwordMinLen8withLowerCaseAndSpecialChar)) {
//       return null;
//     } else {
//       return errorMessage == null ? StringConstant.errPassword : errorMessage;
//     }
//   }
// }
