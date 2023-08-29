import 'package:dio/dio.dart';
import 'package:shopping_app/constant.dart';

class ApiService {
  final String _baseUrl = 'https://student.valuxapps.com/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'lang': kLang,
          'Content-Type': 'application/json',
          'Authorization': kToken,
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'lang': kLang,
          'Content-Type': 'application/json',
          'Authorization': kToken,
        },
      ),
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.put(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'lang': kLang,
          'Content-Type': 'application/json',
          'Authorization': kToken,
        },
      ),
      data: data,
    );
    return response.data;
  }
}
