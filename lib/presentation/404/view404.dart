import 'package:flutter/material.dart';
import 'package:hs_app/presentation/common/texts.dart';
import 'package:yeet/yeet.dart';

import '../../common/hs_colors.dart';

class View404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Heading('Oops, page not found!'),
          SizedBox(height: 20),
          Center(
            child: Container(
              height: 290,
              width: 290,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HSColors.mainColor,
              ),
              child: Center(
                  child: Text(
                '404',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => context.yeet('/'), child: Text('Go back!')),
          Spacer(),
        ],
      ),
    );
  }
}
