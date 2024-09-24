/*
 * @Author: kaic
 * @Date: 2024-09-21 17:15:22
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-21 22:37:18
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter5/ScaffoldTest.dart';

class ContainerComponentTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Container component test")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("Hello kk"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("kkkkk"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Text("kkkkk"),
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.orange.shade700]),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0)
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 120.0),
                  constraints:
                      BoxConstraints.tightFor(width: 200.0, height: 150.0),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Colors.red, Colors.orange],
                        center: Alignment.topLeft,
                        radius: 0.98,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0)
                      ]),
                  transform: Matrix4.rotationZ(.2),
                  alignment: Alignment.center,
                  child: Text(
                    "5.20",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
                _avatarWidget(),
                ClipOval(child: _avatarWidget()),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: _avatarWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, // 宽度设置为原来的一半
                      child: _avatarWidget(),
                    ),
                    Text("hello flutter",
                        style: TextStyle(color: Colors.green)),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(children: [Text("data" * 30)]),
                  ),
                ),
                ElevatedButton(
                  child: Text("Scaffold test page"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ScaffoldRoute();
                    }));
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget _avatarWidget() {
    return Image.asset("icons/lovely_doge.jpeg", width: 60.0);
  }
}
