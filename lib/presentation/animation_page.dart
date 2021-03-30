import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.repeat();
        },
        child: Icon(Icons.adjust_sharp),
      ),
      body: Center(
        child: RotationTransition(
          turns: CurveTween(curve: Curves.linear).animate(animationController),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
