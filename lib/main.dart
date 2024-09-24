/*
 * @Author: kaic
 * @Date: 2024-03-07 21:09:05
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-24 21:07
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
// 导入包
import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter2/C2_3.dart';
import 'package:flutter_demo/chapter2/C2_4.dart';
import 'package:flutter_demo/chapter2/C2_5.dart';
import 'package:flutter_demo/chapter2/Echo.dart';
import 'package:flutter_demo/chapter3/C3_1.dart';
import 'package:flutter_demo/chapter4/C4.dart';
import 'package:flutter_demo/chapter5/C5.dart';
import 'package:flutter_demo/chapter6/C6.dart';
import 'package:flutter_demo/chapter6/GridViewTest.dart';
import 'package:flutter_demo/chapter6/PageViewTest.dart';

// 应用入口
void main() {
  runApp(const MainApp());
}

// 应用结构
// Widget 只是一个描述UI元素的配置信息，
// 真正的布局、绘制是根据 Widget 生成 Element 树，再根据 Element 树生成 Render 树，再根据 Render 树生成 Layer。
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 无状态Widget，直接构建build函数
    return MaterialApp(
      title: "🍊 x Flutter",
      theme: ThemeData(primarySwatch: Colors.blue),
      // 初始路由（Home界面）
      initialRoute: "/",
      // 注册路由表 [key:value] => [route_name: route_page]
      // 有了路由表后，我们就可以使用「命名路由」来跳转界面。
      routes: {
        "/": (context) =>
            const MyHomePage(title: "🍊 Lab x Flutter Demo Home Page"),
        "new_page": (context) => NewRoute(),
        "named_route": (context) => EchoRoute(),
        "basic_component": (context) => BasicComponentPage(),
        "layout_component": (context) => LayoutComponentRoute(),
        "container_component": (context) => ContainerComponentTest(),
        "scrollable_component": (context) => const ScrollableComponentPage(),
        "grid_component": (context) => const GridViewTest(),
        "page_component": (context) => const PageViewTest(),
      },
      // 通过 / 注册了 home 路由后，这里就可以不用再定义了。
      // home: MyHomePage(title: "🍊 Lab x Flutter Demo Home Page"),
      // 路由钩子，如果没有在 routes 路由表中定义的路由，在调用 Navigator.of(context).pushNamed() 时则会回调 onGenerateRoute
      // 我们可以在这里处理一些路由钩子，比如：打开某些页面时，若用户已经登录，则跳转，否则回跳到登录界面
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name!;
          print("路由名称是：$routeName");
          // 根据实际情况跳转相应的界面
          return NewRoute();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Key 是这个 Widget 的标识，用于决定是否在下一次 build 时复用旧的 widget，决定条件在 canUpdate 函数中。
  // required 表示命名参数，Widget 的构造函数参数应使用命名参数。
  const MyHomePage({super.key, required this.title});

  // Widget 中定义的属性必须是 final 的，Widget 本身是不可变的，Widget 中的属性变化会重新构建 Widget。
  final String title;

  // createState 创建和 StatefulWidget 相关的状态。
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

// 一个 StatefulWidget 类会对应一个 State 类，表示对应的 StatefulWidget 的状态。
// State 中有两个重要的属性：
// 1. widget 表示该 State 实例行关联的 widget 实例。
// 2. context StatefulWidget 对应的 BuildContext。
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // 调用 setState 通知 Flutter 框架状态发生改变，重新调用 build 函数重新构建 widget 树，从而达到更新 UI 的目的。
    setState(() {
      _counter++;
    });
  }

  // BuildContext 表示当前 widget 在 widget 树中的上下文，每一个 widget 都会对应一个 context 对象。
  @override
  Widget build(BuildContext context) {
    // 每次状态改变都调用此函数，刷新界面UI（状态保存在State中）
    return Scaffold(
      // Scaffold 是 Material 库提供的页面脚手架
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('pushed times: '),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Echo(text: "Echo widget"),
            Builder(
              builder: (context) {
                // 通过当前 widget 的 context 对象，向上便利 widget 树获取父级 widget
                Scaffold scaffold =
                    context.findAncestorWidgetOfExactType<Scaffold>()!;
                return (scaffold.appBar as AppBar).title!;
              },
            ),
            ParentWidgetC(),
            TextButton(
              child: const Text('Open new route'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
            RouterTestRoute(),
            RandomWordsWidget(),
            Image.asset('icons/lovely_doge.jpeg', width: 38, height: 38),
            ElevatedButton(
              child: const Text('Basic Component Page'),
              onPressed: () =>
                  Navigator.of(context).pushNamed("basic_component"),
            ),
            ElevatedButton(
              child: const Text("Layout Component Page"),
              onPressed: () =>
                  Navigator.of(context).pushNamed("layout_component"),
            ),
            ElevatedButton(
              child: const Text("Container Component Page"),
              onPressed: () =>
                  Navigator.of(context).pushNamed("container_component"),
            ),
            ElevatedButton(
              child: const Text("Scrollable Component Page"),
              onPressed: () =>
                  Navigator.of(context).pushNamed("scrollable_component"),
            ),
            ElevatedButton(
              child: const Text("Grid View Page"),
              onPressed: () =>
                  Navigator.of(context).pushNamed("grid_component"),
            ),
            ElevatedButton(
              child: const Text("Page View Page"),
              onPressed: () =>
                  Navigator.of(context).pushNamed("page_component"),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
