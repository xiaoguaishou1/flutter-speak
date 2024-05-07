/*
 * @Author: panghu tompanghu@gmail.com
 * @Date: 2024-04-29 17:05:22
 * @LastEditors: panghu tompanghu@gmail.com
 * @LastEditTime: 2024-05-07 17:31:08
 * @FilePath: /speak/lib/components/CustomBottomBar/index.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
//自定义bottombar

import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 80,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 3),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9DDFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x38000C3A),
                      blurRadius: 45,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => onItemTapped(0),
                      icon: Icon(
                        Icons.message,
                        color: selectedIndex == 0
                            ? Colors.blue
                            : const Color.fromARGB(255, 14, 14, 14),
                        size: 25,
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () => onItemTapped(1),
                          icon: Icon(
                            Icons.home,
                            color: selectedIndex == 1
                                ? Colors.blue
                                : const Color.fromARGB(255, 14, 14, 14),
                            size: 30,
                          ),
                        ),
                        const Text('home')
                      ],
                    ),
                    IconButton(
                      onPressed: () => onItemTapped(2),
                      icon: Icon(
                        Icons.messenger_rounded,
                        color: selectedIndex == 2
                            ? Colors.blue
                            : const Color.fromARGB(255, 14, 14, 14),
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
