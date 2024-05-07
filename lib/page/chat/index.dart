/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-07 17:07:08
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 21:24:46
 * @FilePath: /speak/lib/page/chat/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ChatContainer extends HookWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用useState来模拟消息数据

    final messagesList = useState<List<Message>>([
      Message(content: '你好！', isRobot: true),
      Message(content: '你好，有什么可以帮助你的？', isRobot: false),
      Message(content: '请问如何使用 Flutter?', isRobot: true),
      Message(content: '请问如何使用 Flutter?', isRobot: false),
      Message(content: '你好，有什么可以帮助你的？', isRobot: false),
      Message(content: '你好，有什么可以帮助你的？', isRobot: false),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
      Message(content: '你好！', isRobot: true),
    ]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'AI Chat',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF000C3A),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_circle_left_outlined,
                size: 30, color: Color(0xFFD9DDFF)),
            onPressed: () {
              context.go('/');
            },
          ),
          //右边的icon
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_horiz_outlined,
                  size: 30, color: Color(0xFFD9DDFF)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz_outlined,
                  size: 30, color: Color(0xFFD9DDFF)),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: MessageContainer(messages: messagesList.value),
            ),
            const SendMessage(),
          ],
        ),
      ),
    );
  }
}

class MessageContainer extends HookWidget {
  final List<Message> messages;
  const MessageContainer({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(bottom: 110), // 根据需要调整底部padding的大小
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return Align(
              alignment: message.isRobot
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (message.isRobot) ...[
                    const CircleAvatar(child: Text('R')),
                    const SizedBox(width: 8),
                  ],
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          message.isRobot ? Colors.grey[200] : Colors.blue[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(message.content),
                  ),
                  if (!message.isRobot) ...[
                    const SizedBox(width: 8),
                    const CircleAvatar(child: Text('U')),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Message {
  final String content;
  final bool isRobot;
  Message({required this.content, required this.isRobot});
}

class SendMessage extends HookWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _controller = useTextEditingController();

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2, // 占据可用空间的1/10
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9DDFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.mic_outlined,
                    size: 30, color: Color(0xFF6B6C74)),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            flex: 2, // 占据可用空间的1/10
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9DDFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: IconButton(
                icon:
                    const Icon(Icons.image, size: 30, color: Color(0xFF6B6C74)),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            flex: 8, // 占据剩余的8/10的可用空间
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10, top: 3),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9DDFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  hintStyle: const TextStyle(
                    color: Color(0xFF6B6C74),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // 处理发送按钮点击事件
                      print(_controller.value.text);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
