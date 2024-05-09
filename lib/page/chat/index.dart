/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-07 17:07:08
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-09 14:32:58
 * @FilePath: /speak/lib/page/chat/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:nanoid/non_secure.dart';
import 'package:speak/apiResponse/stream_response.dart';
import 'package:speak/utils/dioSteam.dart';

class Message {
  final String content;
  final bool isRobot;
  final String? Id;
  Message({required this.content, required this.isRobot, required this.Id});
}

class ChatContainer extends HookWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用useState来模拟消息数据
    final messagesList = useState<List<Message>>([]);

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
            SendMessage(
              onSend: (String message) {
                messagesList.value = [
                  ...messagesList.value,
                  Message(content: message, isRobot: false, Id: nanoid(10)),
                ];
              },
              onPush: ({
                required String content,
                required String Id,
              }) {
                messagesList.value = [
                  ...messagesList.value,
                  Message(content: content, isRobot: true, Id: Id),
                ];
              },
            ),
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
    // 创建 ScrollController 对象
    final ScrollController _controller = useScrollController();
    // 使用 useEffect 来监听 messages 的长度变化，并滚动到最底部

    useEffect(() {
      void scrollToBottom() {
        if (_controller.hasClients) {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      }

      scrollToBottom();
      return null;
    }, [messages.length]); // 依赖 messages 的长度，而不是整个 messages 列表

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60), // 底部添加60像素的内边距
      controller: _controller,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Align(
          alignment:
              message.isRobot ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (message.isRobot) ...[
                  const CircleAvatar(child: Text('R')),
                  const SizedBox(width: 8),
                ],
                Container(
                    //最大宽度
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          message.isRobot ? Colors.grey[200] : Colors.blue[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(message.content,
                        style: const TextStyle(
                          color: Color(0xFF000C3A),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          //文本换行
                        ))),
                if (!message.isRobot) ...[
                  const SizedBox(width: 8),
                  const CircleAvatar(child: Text('U')),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class SendMessage extends HookWidget {
  final void Function(String message) onSend;
  final void Function({required String content, required String Id}) onPush;
  const SendMessage({super.key, required this.onSend, required this.onPush});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = useTextEditingController();
    final streamText = useState<String>('');
    void handleData(String data) {
      if (data.trim() == '[DONE]') {
        print(streamText.value);
        onPush(content: streamText.value, Id: nanoid(10));
        streamText.value = '';
        return;
      }
      try {
        var jsonData = json.decode(data);
        var myModel = StreamResponse.fromJson(jsonData); // 假设使用正确的 JSON key 和结构
        streamText.value += myModel.choices[0].delta!.content!;
      } catch (e) {
        print('Error processing data: $e');
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
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
            flex: 2,
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
            flex: 8,
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
                      onSend(_controller.value.text);

                      StreamSSE(
                        'https://open.bigmodel.cn/api/paas/v4/chat/completions',
                        data: {
                          "model": "glm-4",
                          "messages": [
                            {"role": "user", "content": _controller.value.text}
                          ],
                          "temperature": 0.3,
                          "stream": true,
                        },
                        onData: handleData,
                      );

                      _controller.clear();
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
