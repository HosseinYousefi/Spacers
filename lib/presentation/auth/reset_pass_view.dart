import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

class ResetPassView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text('Back'),
        onPressed: () {
          context.yeet();
        },
      ),
    );
  }
}
