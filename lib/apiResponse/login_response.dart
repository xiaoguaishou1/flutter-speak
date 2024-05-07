/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-06 17:31:07
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 16:15:18
 * @FilePath: /speak/lib/api/login_response.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart'; // 注意：这里的部分文件名需要与源文件名对应

@JsonSerializable()
class LoginResponse {
  final String msg;
  final int code;
  final String token;

  LoginResponse({required this.msg, required this.code, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
