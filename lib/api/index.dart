/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-06 16:13:36
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 16:27:39
 * @FilePath: /speak/lib/api/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
// ignore: implementation_imports
import 'package:dio/dio.dart';
import 'package:speak/apiResponse/login_response.dart';
import 'package:speak/apiResponse/toolbox_catalog_response.dart';
import 'package:speak/apiResponse/toolbox_response.dart';
import 'package:speak/utils/request.dart';

class ApiService {
  final Dio httpClient = HttpClient().dio;

  // 登录方法
  Future<LoginResponse> login(
      {required String username, required String password}) async {
    Response response = await httpClient.post(
      '/loginNoCode',
      data: {'username': username, 'password': password},
    );
    return LoginResponse.fromJson(response.data);
  }

  //查询工具箱目录
  // ignore: non_constant_identifier_names
  Future<ToolboxList> ToolboxCatalog() async {
    Response response = await httpClient.get('/ai/catalogue/list');
    return ToolboxList.fromJson(response.data);
  }

  //查询工具箱
  // ignore: non_constant_identifier_names
  Future<ToolboxCatalogResponse> ToolboxCatalogDetail(
      {required String catalogueId}) async {
    Response response =
        await httpClient.get('/ai/config/list', queryParameters: {
      'catalogueId': catalogueId,
    });
    return ToolboxCatalogResponse.fromJson(response.data);
  }
}
