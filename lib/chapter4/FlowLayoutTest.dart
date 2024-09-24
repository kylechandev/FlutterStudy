/*
 * @Author: kaic
 * @Date: 2024-09-21 16:24:44
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-21 16:29:54
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
import 'package:flutter/material.dart';

class FlowLayoutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flow layout test")),
      body: Center(
        child: Column(
          children: [
            Wrap(
              spacing: 8.0, // 水平间距
              runSpacing: 4.0, // 垂直间距
              alignment: WrapAlignment.start,
              children: [
                Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("A")),
                    label: Text("Hamilton")),
                Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("A")),
                    label: Text("Hamilton")),
                Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("A")),
                    label: Text("Hamilton")),
                Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("A")),
                    label: Text("Hamilton")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
