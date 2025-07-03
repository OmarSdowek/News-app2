import 'dart:math';

import 'package:dio/dio.dart';
import 'package:news/core/networking/end_point.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(BaseOptions(
        baseUrl: EndPoint.baseUrl, receiveDataWhenStatusError: true));
  }

  static getRequest({
    required String endPoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response? response = await dio!.get(endPoint, queryParameters: query);

      return response;
    } catch (e) {
      print(e.toString());
    }
  }


  static postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response? response = await dio?.post(endPoint, data: data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
