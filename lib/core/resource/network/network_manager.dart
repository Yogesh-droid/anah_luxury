import 'package:anah_luxury/core/resource/network/client.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  final Dio _dio = Client().dio;

  Future<Response?> makeNetworkRequest(RequestParams requestParams) async {
    Response response;
    Options options = Options(headers: requestParams.header);
    switch (requestParams.apiMethods) {
      case ApiMethods.get:
      print(requestParams.url);
      
        response = await _dio.get(requestParams.url,options: options);
        return response;

      default:
        return null;
    }
  }
}
