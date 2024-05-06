/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-06 15:59:50
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-06 16:17:32
 * @FilePath: /speak/lib/utils/request.dart
 * @Description: 封装拦截器
 */
import 'package:dio/dio.dart';

class HttpClient {
  static final HttpClient _instance = HttpClient._internal();

  factory HttpClient() {
    return _instance;
  }

  late Dio dio;

  HttpClient._internal() {
    dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        dio.options.baseUrl = 'http://192.168.0.121:8181';
        // 检查当前请求是否是登录接口
        bool isLoginApi = options.path.contains('/loginNoCode');

        // 在发送请求之前做些预处理
        options.headers['Content-Type'] = 'application/json';

        if (!isLoginApi) {
          // 只有非登录请求才添加Token
          options.headers['Authorization'] = 'Bearer your_token';
        }

        print('Sending request to ${options.uri}');
        handler.next(options); // 继续执行请求
      },
      onResponse: (response, handler) {
        // 在返回响应数据之前做些预处理
        print('Received response from ${response.requestOptions.uri}');
        handler.next(response); // 继续执行响应
      },
      onError: (DioError error, handler) {
        // 当请求失败时做些预处理
        print(
            'Request to ${error.requestOptions.uri} failed with status ${error.response?.statusCode}');
        handler.next(error); // 继续执行错误处理
      },
    ));
  }
}
