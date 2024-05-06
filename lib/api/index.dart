/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-06 16:13:36
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-06 16:17:10
 * @FilePath: /speak/lib/api/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
// ignore: implementation_imports
import 'package:dio/src/response.dart';
import 'package:speak/utils/request.dart';

var httpClient = HttpClient().dio;

//登录
Future<Response> login({required String username, required String password}) {
  return httpClient
      .post('/loginNoCode', data: {'username': username, 'password': password});
}
