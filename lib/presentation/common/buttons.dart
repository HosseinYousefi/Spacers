import 'package:flutter/material.dart';
import 'package:hs_app/common/hs_colors.dart';

class HSPrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const HSPrimaryButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50,
      decoration: BoxDecoration(
        color: HSColors.mainColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onTap: onPressed,
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            child: child ?? Container(),
          ),
        ),
      ),
    );
  }
}

class HSSecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const HSSecondaryButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: HSColors.mainColor),
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              color: HSColors.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            child: child ?? Container(),
          ),
        ),
      ),
    );
  }
}
