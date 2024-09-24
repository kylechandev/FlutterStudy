/*
 * @Author: kaic
 * @Date: 2024-09-21 16:24:44
 * @LastEditors: kylechandev kylechan47@gmail.com
 * @LastEditTime: 2024-09-21 16:46:34
 * Copyright (c) 2024 by kylechandev kylechan47@gmail.com, All Rights Reserved. 
 */
import 'package:flutter/material.dart';

class StackLayoutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack layout and Absolute position test")),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text("Hello", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text("KK"),
              ),
              Positioned(
                right: 18.0,
                child: Text("RIGHT"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
