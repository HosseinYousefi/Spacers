import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';

final counterProvider = StateProvider((_) => 0);
final doubleProvider = Provider((ref) => ref.watch(counterProvider).state * 2);
final tripleProvider = Provider<int>((ref) {
  final counter = ref.watch(counterProvider).state;
  final doubleCounter = ref.watch(doubleProvider);
  return counter + doubleCounter;
});

class DemoPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${counter.state}', style: TextStyle(fontSize: 40)),
            ElevatedButton(
                onPressed: () => counter.state++, child: Text('Increase')),
            ElevatedButton(
                onPressed: () => counter.state--, child: Text('Decrease')),
            ElevatedButton(
                onPressed: () => context.yeet(), child: Text('Yeet')),
            DoubleWidget(),
          ],
        ),
      ),
    );
  }
}

class DoubleWidget extends HookWidget {
  DoubleWidget();

  @override
  Widget build(BuildContext context) {
    final counter = useProvider(doubleProvider);
    return Container(
      color: Colors.lightBlue,
      width: 100,
      height: 100,
      child: Center(
        child: Text('$counter', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
