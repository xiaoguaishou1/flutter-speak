/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-04-29 15:53:30
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 11:41:54
 * @FilePath: /speak/lib/router/index.dart
 * @Description: 路由配置
 */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak/page/Index/index.dart';
import 'package:speak/page/home/index.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Index();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    )
  ],
);
