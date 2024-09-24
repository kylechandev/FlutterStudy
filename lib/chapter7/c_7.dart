/*
 * @Author: kaic
 * @Date: 2024-09-24 21:19
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-25 00:04
 * Copyright (c) 2024 by kaic, All Rights Reserved. 
 */

import 'dart:collection';

import 'package:flutter/material.dart';

class C7Page extends StatefulWidget {
  const C7Page({super.key});

  @override
  State<C7Page> createState() => _C7PageState();
}

class _C7PageState extends State<C7Page> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Functional Component Test"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _TestWidget(), // _TestWidget inherited from ShareDataWidget
              ),
              ElevatedButton(
                child: const Text("Increment"),
                onPressed: () {
                  setState(() {
                    ++count;
                  });
                },
              ),
              const ProviderRoute(),
            ],
          ),
        ),
      ),
    );
  }
}

// 用来共享数据的 widget，两个参数，一个 child widget 和一个 data（理解成一个包装的ViewGroup）
class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({super.key, required super.child, required this.data});

  // 需要在子树中共享的数据
  final int data;

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新进行build
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // return true;
    return oldWidget.data != data;
  }
}

// 这个才是我们真正展示的 ui widget，作为 inheritedWidget 的 child widget
class _TestWidget extends StatefulWidget {
  const _TestWidget();

  @override
  State<_TestWidget> createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // 获取到父 InheritedWidget 的共享数据
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    // 如果build中没有依赖InheritedWidget的数据，则此回调不会被调用。
    debugPrint("Dependencies change");
  }
}

// ===============================================================================================

// 一个通用的InheritedWidget，保存需要跨组件共享的状态
// 理解为是一个保存数据的地方
class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({super.key, required super.child, required this.data});

  final T data;

  static InheritedProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedProvider>();
  }

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) {
    // 在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

class ChagneNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChagneNotifierProvider({super.key, required this.data, required this.child});

  final Widget child;
  final T data;

  // 定义了一个of()静态方法供子类方便获取Widget树中的InheritedProvider中保存的共享状态(model)
  static T of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget as InheritedProvider<T>;
    return provider!.data;
  }

  @override
  State createState() => _ChagneNotifierProviderState<T>();
}

// 主要作用就是监听到共享状态（model）改变时重新构建Widget树
class _ChagneNotifierProviderState<T extends ChangeNotifier> extends State<ChagneNotifierProvider<T>> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(ChagneNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      // 当Provider更新时，如果新旧数据不相等，则解绑旧数据监听，同时添加新数据监听
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 返回 包装ViewGroup，也就是我们的 InheritedProvider
    return InheritedProvider(
        // 共享数据
        data: widget.data,
        // 子 widget
        child: widget.child);
  }
}

class Item {
  double price; // 商品单价
  int count; // 商品数量
  Item({
    required this.price,
    required this.count,
  });
}

class CardModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0.0, (value, item) => value + item.price * item.count);

  void add(Item item) {
    print("add item: ${item.price}");
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({super.key});

  @override
  State<ProviderRoute> createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // 如果我们将ChangeNotifierProvider放在整个应用的Widget树的根上，那么整个APP就可以共享购物车的数据了，这时ChangeNotifierProvider的优势将会非常明显。
      child: ChagneNotifierProvider(
          data: CardModel(), // 共享的数据
          child: Builder(builder: (context) {
            return Center(
              child: Column(
                children: <Widget>[
                  Builder(builder: (context) {
                    // 获取共享数据
                    var cart = ChagneNotifierProvider.of<CardModel>(context);
                    return Text("总价：${cart.totalPrice}");
                  }),
                  Builder(
                    builder: (context) {
                      print("elevatedButton build");
                      return ElevatedButton(
                        child: const Text("添加商品"),
                        onPressed: () {
                          ChagneNotifierProvider.of<CardModel>(context, listen: false).add(Item(price: 20, count: 1));
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          })),
    );
  }
}
