/*
 * @Author: kaic
 * @Date: 2024-09-19 23:42:24
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-21 11:15:38
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New route'),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                child: Text("Back"),
                onPressed: () => Navigator.of(context).pop('Back param'),
              ),
              ElevatedButton(
                child: Text("Back to home"),
                onPressed: () => Navigator.of(context).pushNamed("/"),
              ),
              ElevatedButton(
                child: Text("Go to named route"),
                onPressed: () => Navigator.of(context)
                    // 命名路由传递参数
                    .pushNamed("named_route", arguments: "hi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Open tip route'),
        onPressed: () async {
          // 通过 async await 返回的 Future 来获取新路由的返回数据。
          var result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TipRoute(text: '我是提示xxxx2.0');
          }));
          print("路由返回值：$result");
        },
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 接收命名路由传递过来的参数
    var args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('i am title!')),
      body: Center(
        child: Text('Echo route, test named route pass param: $args'),
      ),
    );
  }
}
