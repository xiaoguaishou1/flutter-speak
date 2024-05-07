/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-04-29 14:35:19
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 21:14:41
 * @FilePath: /speak/lib/page/Index/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:speak/api/index.dart';
import 'package:speak/apiResponse/login_response.dart';
import 'package:speak/apiResponse/toolbox_catalog_response.dart';
import 'package:speak/apiResponse/toolbox_response.dart';
import 'package:speak/components/CustomBottomBar/index.dart';
import 'package:speak/utils/base.dart';
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
    // 底部导航栏选中的索引
    final selectedIndex = useState(0);
    // 登录状态
    final loginSuccess = useState(false);
    // 工具箱目录
    final toolboxCatalog = useState<List<ToolboxListData>>([]);

    // 底部导航栏点击事件
    void onItemTapped(int index) {
      selectedIndex.value = index;
      switch (index) {
        case 0:
          context.go('/');
          break;
        default:
      }
    }

    //  登录
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
      toolboxCatalog.value = response.data;
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
        Toolbox(toolboxCatalog: toolboxCatalog.value)
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomBar(
        selectedIndex: selectedIndex.value,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

class Toolbox extends HookWidget {
  final List<ToolboxListData> toolboxCatalog; // 确保这是列表类型
  const Toolbox({super.key, required this.toolboxCatalog});

  @override
  Widget build(BuildContext context) {
    final selectedToolboxId = useState<String>(''); // 按钮选中的状态
    final toolboxDetail = useState<List<ToolboxCatalogItem>>([]); // 工具箱详情
    // 查询目录详情
    void handleToolboxDetail({String? id}) async {
      // 通过目录id查询工具箱详情
      var response = await ApiService().ToolboxCatalogDetail(
        catalogueId: id != null ? id : selectedToolboxId.value,
      );
      toolboxDetail.value = response.rows;
    }

    //默认查询第一个目录详情
    useMemoized(() {
      if (toolboxCatalog.isNotEmpty) {
        handleToolboxDetail(id: toolboxCatalog[0].catalogueId);
      }
    }, [toolboxCatalog]);

    // 用于存储随机颜色的变量
    final randomColor = useMemoized(() {
      return [
        const Color(0xFF295BFF),
        const Color(0xFFCE7CFF),
        const Color(0xFFFFCD29),
        const Color(0xFFA8B2FF)
      ][Random().nextInt(4)];
    });

    return Container(
      margin: const EdgeInsets.only(top: 50, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '工具箱',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFF000C3A),
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          // 横向滚动视图
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: toolboxCatalog.map<Widget>((item) {
                    return GestureDetector(
                      onTap: () {
                        selectedToolboxId.value =
                            item.catalogueId; // 假设每个工具项有'catalogueId'属性
                        handleToolboxDetail();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: selectedToolboxId.value == item.catalogueId
                              ? const Color(0xFF295BFF)
                              : const Color(0xFFD9DDFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.name, // 假设每个工具项有'name'属性
                          style: TextStyle(
                            color: selectedToolboxId.value == item.catalogueId
                                ? Colors.white
                                : const Color(0xFF000C3A),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }).toList()),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: toolboxDetail.value.map<Widget>((item) {
                    return GestureDetector(
                      onTap: () => {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, top: 20),
                        width: 141,
                        height: 149,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 17),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: [
                            const Color(0xFF295BFF),
                            const Color(0xFFCE7CFF),
                            const Color(0xFFFFCD29),
                            const Color(0xFFA8B2FF)
                          ][Random().nextInt(4)],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 24,
                                      height: 24,
                                      child: Image.network(
                                        '$baseURL${item.url}',
                                        width: 28,
                                        height: 28,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 107,
                              child: Text(
                                item.synopsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
