import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;

  Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline3);
  }
}

class Subheading extends StatelessWidget {
  final String text;

  Subheading(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline5);
  }
}
