/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-06 16:35:27
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-06 18:03:16
 * @FilePath: /speak/lib/utils/shared.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
//保存token
import 'package:speak/utils/TokenStorage.dart';

void saveUserToken(String token) async {
  bool result = await TokenStorage.saveToken(token);
  // if (result) {
  //   print("Token saved successfully!");
  // } else {
  //   print("Failed to save token.");
  // }
}

//获取token

retrieveUserToken() async {
  String? token = await TokenStorage.getToken();
  // if (token != null) {
  //   print("Retrieved token: $token");
  //   return token;
  // } else {
  //   print("No token found.");
  // }
}
