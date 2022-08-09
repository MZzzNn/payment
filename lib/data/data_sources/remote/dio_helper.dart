import 'package:dio/dio.dart';
import 'package:payment/data/data_sources/remote/end_points.dart';

class DioHelperPayment {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: EndPointsManger.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await _dio.get(url,queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,required Map<String, dynamic> data ,Map<String, dynamic>? query}) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await _dio.post(url,data: data,queryParameters: query);
  }




}
