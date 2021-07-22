import 'package:flutter/material.dart';
import 'package:sample_network_calls/constants/strings/http_constants.dart';
import 'package:sample_network_calls/services/networks/dio_api_services.dart';
import 'package:sample_network_calls/wrappers/user_list_wrapper.dart';

class SampleCallsProvider extends ChangeNotifier {
  late String error;
  Future<UserListWrapper?> getUserList() async {
    try {
      var res = await DioApiServices().getRequest(
        HTTPConstants.getListOfUser,
      );
      notifyListeners();
      return UserListWrapper.fromJson(res);
    } catch (e) {
      print(e);
      error = e.toString();
      notifyListeners();
    }
  }
}
