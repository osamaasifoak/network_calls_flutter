import 'package:dio/dio.dart';
import 'package:sample_network_calls/constants/strings/http_constants.dart';
import 'package:sample_network_calls/constants/strings/shared_preference_constants.dart';
import 'package:sample_network_calls/services/shared_preferences_service.dart';

class DioClientNetwork {
  late Dio dio;
  String? authToken;
  initializeDioClientNetwork() async {
    dio = Dio();
    dio.options = setBaseOptions();
    dio.interceptors.add(LogInterceptor(
        request: true, responseBody: true, requestBody: true, error: true));
    dio.interceptors.add(
      InterceptorsWrapper(
          onRequest: requestInterceptor, onError: errorInterceptor),
    );
    print(dio.options.headers);
  }

  BaseOptions setBaseOptions() {
    return BaseOptions(
      // connectTimeout: 50,
      connectTimeout: 60000,
      baseUrl: HTTPConstants.baseUrl,
    );
  }

  void requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (authToken == null) {
      var _token = await SharedPreferencesService()
          .getStringFromSF(SharedPreferenceConstants.apiAuthToken);
          
      if (_token != null) {
        authToken = _token;
        dio.options.headers["Authorization"] = "Bearer " + authToken!;
        handler.next(options);
      }
      handler.next(options);
    } else {
      dio.options.headers["Authorization"] = "Bearer " + authToken!;
      handler.next(options);
    }
  }

  dynamic errorInterceptor(
      DioError dioError, ErrorInterceptorHandler handler) async {
    if (dioError.message.contains("ERROR_001")) {
      // this will push a new route and remove all the routes that were present
      // navigatorKey.currentState.pushNamedAndRemoveUntil(
      //     "/login", (Route<dynamic> route) => false);
    }
    handler.next(dioError);
  }
}


    // if (authToken == null) {
    //   var _token = await SharedPreferencesService()
    //       .getStringFromSF(SharedPreferenceConstants.apiAuthToken);
    //   if (_token != null) {
    //     dio.options.headers["token"] = authToken = _token;
    //   } else {
    //     dio.options.headers["token"] = null;
    //   }
    // }