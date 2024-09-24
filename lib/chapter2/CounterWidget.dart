/*
 * @Author: kaic
 * @Date: 2024-09-19 23:01:29
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-19 23:15:05
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.initValue = 0});

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  // 当 widget 第一次插入到 widget 树时会被调用，对于每一个State对象，Flutter 框架只会调用一次该回调，所以，通常在该回调中做一些一次性的操作，如状态初始化。
  @override
  void initState() {
    super.initState();
    _count = widget.initValue;

    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('$_count'),
          onPressed: () => setState(() {
            ++_count;
          }),
        ),
      ),
    );
  }

  // 在 widget 重新构建时，Flutter 框架会调用widget.canUpdate来检测 widget 树中同一位置的新旧节点，然后决定是否需要更新，如果widget.canUpdate返回true则会调用此回调。
  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  // 当 State 对象从树中被移除时，会调用此回调。
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  // State 对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // 当State对象的依赖发生变化时会被调用；
  // 典型的场景是当系统语言 Locale 或应用主题改变时，Flutter 框架会通知 widget 调用此回调。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class StateLifecycleTest extends StatelessWidget {
  const StateLifecycleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterWidget();
  }
}
