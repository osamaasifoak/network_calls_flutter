import 'package:flutter/material.dart';
import 'package:sample_network_calls/constants/strings/http_constants.dart';
import 'package:sample_network_calls/services/networks/dio_api_services.dart';
import 'package:sample_network_calls/wrappers/user_list_wrapper.dart';

class SampleCallsProvider extends ChangeNotifier {
  late UserListWrapper? userListWrapper;
  late String error;
  bool showLoader = true;
  Future<UserListWrapper?> getUserList() async {
    try {
      var res = await DioApiServices().getRequest(
        HTTPConstants.getListOfUser,
      );
      userListWrapper = UserListWrapper.fromJson(res);
    } catch (e) {
      error = e.toString();
    }
    changeLoaderState(false);
  }

  changeLoaderState(bool loaderState) {
    showLoader = loaderState;
    notifyListeners();
  }
}
