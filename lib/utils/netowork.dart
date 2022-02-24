import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class _UrlPath{
  static const bookshelf = "mock/bookshelf.json";
}

class Network {
  static late Dio _dio;

  static Future init() async {
    _dio = Dio();
    _dio.options.baseUrl = 'http://www.shuqi.com/';
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.responseType = ResponseType.json;
    _dio.options.receiveDataWhenStatusError = true;
    _dio.interceptors.add(LogInterceptor(
        requestHeader: true, requestBody: true, responseBody: true));

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var cj = PersistCookieJar(
        ignoreExpires: true, storage: FileStorage(appDocPath + "/.cookies/"));
    _dio.interceptors.add(CookieManager(cj));
  }




}
