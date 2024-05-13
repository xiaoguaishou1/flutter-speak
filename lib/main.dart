/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-04-29 11:04:59
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-13 14:52:07
 * @FilePath: /speak/lib/main.dart
 * @Description: main dart
 */
import 'package:flutter/material.dart';
import 'package:speak/router/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('ready in 3...');
  await Future.delayed(const Duration(seconds: 1));
  print('ready in 2...');
  await Future.delayed(const Duration(seconds: 1));
  print('ready in 1...');
  await Future.delayed(const Duration(seconds: 1));
  print('go!');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
