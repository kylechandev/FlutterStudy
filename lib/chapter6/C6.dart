import 'package:flutter/material.dart';

class ScrollableComponentPage extends StatelessWidget {
  const ScrollableComponentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrollable test"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  Text('I\'m dedicating every day to you'),
                  Text('Domestic life was never quite my style'),
                  Text('When you smile, you knock me out, I fall apart'),
                  Text('And I thought I was so smart'),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 100,
                // 只有 ListView.builder 有这个属性，可以提高性能。
                // itemExtent: 50.0, // 强制高度为50.0
                // 或者我们可以给一个 prototype 原因，来帮助我们自动计算 item 的高度。
                // prototypeItem: ListTile(title: Text("1")),
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text("$index"),
                      subtitle: Text("subtitle: $index"));
                },
                separatorBuilder: (context, index) {
                  return index % 2 == 0
                      ? const Divider(color: Colors.blue)
                      : const Divider(color: Colors.green);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
