/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-06 15:59:50
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-06 18:05:38
 * @FilePath: /speak/lib/utils/request.dart
 * @Description: 封装拦截器
 */
import 'package:dio/dio.dart';
import 'package:speak/utils/TokenStorage.dart';
import 'package:speak/utils/shared.dart';

class HttpClient {
  static final HttpClient _instance = HttpClient._internal();

  factory HttpClient() {
    return _instance;
  }

  late Dio dio;

  HttpClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.0.121:8181/', // 这里替换为你的基础 URL
      connectTimeout: const Duration(seconds: 5), // 连接服务器超时时间，单位是毫秒。
      receiveTimeout: const Duration(seconds: 3), // 接收数据的最长时限，单位是毫秒。
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // 检查当前请求是否是登录接口
        bool isLoginApi = options.path.contains('/loginNoCode');
        // 从 shared_preferences 获取 Token
        String? token = await TokenStorage.getToken();

        // 在发送请求之前做些预处理
        options.headers['Content-Type'] = 'application/json';

        if (!isLoginApi) {
          // 只有非登录请求才添加Token
          options.headers['Authorization'] = 'Bearer $token';
          print(options.headers);
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
