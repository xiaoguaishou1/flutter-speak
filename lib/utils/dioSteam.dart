/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-08 11:14:02
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-09 14:15:16
 * @FilePath: /speak/lib/utils/dioSteam.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

typedef DataCallback = void Function(String data);

class StreamSSE {
  final String url;
  final Map<String, dynamic> data;
  final DataCallback onData;
  StreamSSE(this.url, {required this.data, required this.onData}) {
    _connectToSSE(url, data: data);
  }

  _connectToSSE(String url, {required Map<String, dynamic> data}) {
    SSEClient.subscribeToSSE(
            method: SSERequestType.POST,
            url: url,
            header: {
              "Content-Type": "application/json",
              'Authorization':
                  'Bearer 0ee793de54b1ea18589f1498e314f31a.38G2mNftTkjCMFoW'
            },
            body: data)
        .listen(
      (event) {
        onData(event.data!);
      },
    );
  }
}
