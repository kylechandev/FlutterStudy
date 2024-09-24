/*
 * @Author: kaic
 * @Date: 2024-09-22 09:47:41
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-24 00:24
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
import 'package:flutter/material.dart';

class PageViewTest extends StatelessWidget {
  const PageViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (var i = 0; i < 6; i++) {
      children.add(Page(text: "$i"));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Page View")),
      body: PageView(scrollDirection: Axis.horizontal, children: children),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key, required this.text});

  final String text;

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用，配合 AutomaticKeepAliveClientMixin

    return Center(
      child: Text("hh${widget.text}", textScaler: const TextScaler.linear(5)),
    );
  }

  @override
  bool get wantKeepAlive => true; // 是否需要缓存
}
