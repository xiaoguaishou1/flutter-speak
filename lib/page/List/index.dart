/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-05-09 17:32:45
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-09 17:53:27
 * @FilePath: /speak/lib/page/List/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:speak/components/CustomBottomBar/index.dart';

class CoversationList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    void onItemTapped(int index) {
      selectedIndex.value = index;
      switch (index) {
        case 0:
          context.go('/chat');
        case 1:
          context.go('/');
          break;
        case 2:
          context.go('/list');
          break;
        default:
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text('Explore'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Color.fromARGB(255, 89, 104, 238),
              size: 30,
            ),
            onPressed: () {
              // Scaffold.of(context).openDrawer();
              context.go('/');
            },
          )),
      body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [SearchContainer()]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomBar(
        selectedIndex: selectedIndex.value,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

class SearchContainer extends HookWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.only(left: 20, top: 3),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9DDFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'search for bots or people',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                textController.clear();
              },
            ),
          ),
        ));
  }
}
