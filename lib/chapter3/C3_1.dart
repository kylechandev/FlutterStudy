/*
 * @Author: kaic
 * @Date: 2024-09-21 13:49:48
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-21 14:59:05
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
import 'package:flutter/material.dart';

class BasicComponentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Component Page')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Hello world!'),
              Text(
                "Hello world! I am KK" * 4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text("Hello world", textScaler: TextScaler.linear(2.5)),
              Text(
                "Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              const Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: null),
              ])),
              ElevatedButton(
                  child: Text("Elevated Button"),
                  onPressed: () => print("clicked")),
              TextButton(
                  child: Text("Text Button"),
                  onPressed: () => print("clicked")),
              OutlinedButton(
                  child: Text("Outlined Button"),
                  onPressed: () => print("clicked")),
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => print("clicked")),
              const Image(
                image: AssetImage("icons/lovely_doge.jpeg"),
                width: 100.0,
              ),
              const Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
              const Text(
                "\uE03e \uE237 \uE287",
                style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green,
                ),
              ),
              SwitchAndCheckBoxTestRoute(),
              TextInputTest(),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextInputTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextInputTestState();
  }
}

class _TextInputTestState extends State<TextInputTest> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _upwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _unameController.addListener(() {
      debugPrint(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: _unameController,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              onChanged: (value) => debugPrint("uname: $value"),
            ),
            TextField(
              controller: _upwdController,
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            )
          ],
        ));
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxTestRouteState();
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true;
  bool _checkBoxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Switch(
            value: _switchSelected,
            activeColor: Colors.purple,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            }),
        Checkbox(
            value: _checkBoxSelected,
            activeColor: Colors.purple,
            onChanged: (value) {
              setState(() {
                _checkBoxSelected = value!;
              });
            })
      ],
    ));
  }
}
