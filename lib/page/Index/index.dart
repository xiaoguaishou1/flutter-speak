/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-04-29 14:35:19
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 11:43:30
 * @FilePath: /speak/lib/page/Index/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:speak/api/index.dart';
import 'package:speak/apiResponse/login_response.dart';
import 'package:speak/apiResponse/toolbox_response.dart';
import 'package:speak/components/CustomBottomBar/index.dart';
import 'package:speak/utils/shared.dart';

// class Index extends StatefulWidget {
//   const Index({super.key});
//   @override
//   State<Index> createState() => _IndexState();
// }

// class _IndexState extends State<Index> {
//   final ApiService _apiService = ApiService();
//   int selectedIndex = 0;

//   void onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   void _handleLogin() async {
//     try {
//       LoginResponse response = await _apiService.login(
//         username: "admin",
//         password: "admin123",
//       );
//       print('Login successful: ${response.code}');
//       if (response.code == 200) {
//         // 登录成功后的处理 保存token
//         saveUserToken(response.token);
//         _handleToolboxCatalog();
//       }
//       // 处理登录成功后的逻辑，比如页面跳转
//     } catch (e) {
//       print('Login failed: $e');
//       // 处理错误
//     }
//   }

//   void _handleToolboxCatalog() async {
//     ToolboxList response = await _apiService.ToolboxCatalog();
//     print(response);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _handleLogin();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Container(
//           margin: const EdgeInsets.only(top: 70, left: 10),
//           child: SizedBox(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     '你好,胖猫',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Color(0xFF000C3A),
//                       fontSize: 20,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 const Padding(
//                     padding: EdgeInsets.only(left: 10, right: 10),
//                     child: Text(
//                       '让我们开始你的体验吧.',
//                       style: TextStyle(
//                         color: Color(0xFF000C3A),
//                         fontSize: 14,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: 164,
//                     clipBehavior: Clip.antiAlias,
//                     margin: const EdgeInsets.only(top: 20),
//                     decoration: ShapeDecoration(
//                       color: const Color(0xFF295BFF),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                     ),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin:
//                                       const EdgeInsets.only(top: 20, left: 20),
//                                   child: const Text(
//                                     '选择你的套餐',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 24,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w700,
//                                       height: 0,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Container(
//                                   width: 175,
//                                   margin: const EdgeInsets.only(left: 20),
//                                   child: const Text(
//                                     '解锁你的麦当劳套餐,汉堡,鸡翅,可乐',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w400,
//                                       height: 0,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                     height: 35,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 18, vertical: 8),
//                                     margin: const EdgeInsets.only(
//                                         top: 20, left: 20),
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: ShapeDecoration(
//                                       color: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(40),
//                                       ),
//                                     ),
//                                     child: const Text(
//                                       '开始',
//                                       style: TextStyle(
//                                         color: Color(0xFF000C3A),
//                                         fontSize: 13,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,
//                                         height: 0,
//                                         letterSpacing: 0.08,
//                                       ),
//                                     ))
//                               ]),
//                           Image.asset(
//                             'assets/images/avatar.jpeg',
//                           )
//                         ]),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Container(
//             margin: const EdgeInsets.only(top: 50, left: 20),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '工具箱',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     color: Color(0xFF000C3A),
//                     fontSize: 25,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Row(
//                   children: [],
//                 )
//               ],
//             ))
//       ]),
//       floatingActionButtonLocation: FloatingActionButtonLocation
//           .centerFloat, // 或者使用 FloatingActionButtonLocation.centerFloat
//       floatingActionButton: CustomBottomBar(
//         selectedIndex: selectedIndex,
//         onItemTapped: onItemTapped,
//       ),
//     );
//   }
// }

//使用flutter hooks 重构 Index

class Index extends HookWidget {
  Index({super.key});
  final _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    final loginSuccess = useState(false);
    // 在需要使用的地方获取selectedIndex的值
    int currentIndex = selectedIndex.value;

    void onItemTapped(int index) {
      selectedIndex.value = index;
    }

    void handleLogin() async {
      try {
        LoginResponse response = await _apiService.login(
          username: "admin",
          password: "admin123",
        );
        print('Login successful: ${response.code}');
        if (response.code == 200) {
          // 登录成功后的处理 保存token
          saveUserToken(response.token);
          loginSuccess.value = true;
        }
        // 处理登录成功后的逻辑，比如页面跳转
      } catch (e) {
        print('Login failed: $e');
        // 处理错误
      }
    }

    //查询工具箱目录
    void handleToolboxCatalog() async {
      ToolboxList response = await _apiService.ToolboxCatalog();
      print(response);
    }

    useEffect(() {
      handleLogin();
    }, []);

    useEffect(() {
      handleToolboxCatalog();
    }, [loginSuccess.value]);

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(top: 70, left: 10),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '你好,胖猫',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000C3A),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      '让我们开始你的体验吧.',
                      style: TextStyle(
                        color: Color(0xFF000C3A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 164,
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF295BFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: const Text(
                                    '选择你的套餐',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  width: 175,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    '解锁你的麦当劳套餐,汉堡,鸡翅,可乐',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 35,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 8),
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 20),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    child: const Text(
                                      '开始',
                                      style: TextStyle(
                                        color: Color(0xFF000C3A),
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: 0.08,
                                      ),
                                    ))
                              ]),
                          Image.asset(
                            'assets/images/avatar.jpeg',
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 50, left: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '工具箱',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF000C3A),
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [],
                )
              ],
            ))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // 或者使用 FloatingActionButtonLocation.centerFloat
      floatingActionButton: CustomBottomBar(
        selectedIndex: currentIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
