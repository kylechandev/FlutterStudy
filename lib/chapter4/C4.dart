/*
 * @Author: kaic
 * @Date: 2024-09-18 23:11:27
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-21 17:08:10
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter4/FlexLayoutTest.dart';
import 'package:flutter_demo/chapter4/FlowLayoutTest.dart';
import 'package:flutter_demo/chapter4/StackLayoutTest.dart';
import 'package:flutter_demo/chapter4/LayoutBuilderTest.dart';

class LayoutComponentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout Component")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('top'),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50.0,
                ),
                child: Container(
                  height: 5.0,
                  child: _redBox(),
                )),
            SizedBox(
              width: 80.0,
              height: 80.0,
              child: _redBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ckckckckckckckckck    "),
                Text("gogogogo"),
              ],
            ),
            ElevatedButton(
              child: Text("Flex layout test"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FlexLayoutTestRoute();
                }));
              },
            ),
            ElevatedButton(
              child: Text("Flow layout test"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ocntext) {
                  return FlowLayoutTest();
                }));
              },
            ),
            ElevatedButton(
              child: Text("Stack layout test"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ocntext) {
                  return StackLayoutTest();
                }));
              },
            ),
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue.shade50,
              child: const Align(
                // 指定宽高比例：对于 Align 的 child 的比例，比如这里 child 大小60，效果就是60*2作为 Align 的大小。
                widthFactor: 1.0,
                heightFactor: 1.0,
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            ResponsiveColumn(children: getLayoutBuilderChild()),
            SizedBox(
                width: 190,
                child: ResponsiveColumn(children: getLayoutBuilderChild())),
                // 测试获取 Widget 的大小
            Builder(builder: (context) {
              return GestureDetector(
                child: Text("flutter@kk"),
                // 打印 text 的大小
                onTap: () => print(context.size),
              );
            }),
            
          ],
        ),
      ),
    );
  }

  List<Widget> getLayoutBuilderChild() {
    var _children = List.filled(6, Text("A"));
    return _children;
  }

  Widget _redBox() {
    return DecoratedBox(decoration: BoxDecoration(color: Colors.red));
  }
}
