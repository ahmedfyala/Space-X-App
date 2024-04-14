import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = ApiUrls.baseUrl;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
