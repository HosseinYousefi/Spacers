import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum NinjaCase { first, second }

class NinjaCard extends HookWidget {
  final Widget firstChild;
  final Widget secondChild;
  final double height;
  final double width;
  final void Function(NinjaCase) onSelected;

  NinjaCard({
    required this.firstChild,
    required this.secondChild,
    required this.onSelected,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translationOffset = useState(Offset.zero);
    final rotationAngle = useState(0.0);
    final transformMatrix = useState(Matrix4.identity());

    final currentDy = useState(0.0);
    final dyAtAnimationStart = useState(0.0);
    final holdDownOffset = useState(Offset.zero);

    final hasCrossed = useState(false);
    final animationController = useAnimationController();

    useEffect(
      () {
        final listener = () {
          final signOfDy = currentDy.value.sign;
          final animationValue =
              ElasticOutCurve(5).transform(animationController.value);
          if (dyAtAnimationStart.value.abs() > height * 0.1) {
            currentDy.value = (animationValue *
                    (signOfDy * height - dyAtAnimationStart.value)) +
                dyAtAnimationStart.value;
          } else {
            currentDy.value = (-animationValue * dyAtAnimationStart.value) +
                dyAtAnimationStart.value;
          }
          _updatePosition(
            translationOffset: translationOffset,
            rotationAngle: rotationAngle,
            cardHeight: height,
            deltaY: currentDy.value,
            currentDy: currentDy,
          );
        };
        animationController.addListener(listener);
        return () => animationController.removeListener(listener);
      },
      [
        height,
        width,
      ],
    );
    useEffect(
      () {
        final listener = (status) {
          if (status == AnimationStatus.completed &&
              dyAtAnimationStart.value.abs() > height * 0.1) {
            onSelected(dyAtAnimationStart.value < 0
                ? NinjaCase.first
                : NinjaCase.second);
          }
        };
        animationController.addStatusListener(listener);
        return () => animationController.removeStatusListener(listener);
      },
      [
        height,
        width,
      ],
    );
    final fillUpVelocityFactor = 0.3;
    final firstChildHeightFactor = math.max(
        0.0,
        (0.62 / fillUpVelocityFactor) *
            (-currentDy.value + fillUpVelocityFactor * height) /
            height);
    final secondChildHeightFactor = math.max(
        0.62,
        (0.62 / fillUpVelocityFactor) *
            (currentDy.value + fillUpVelocityFactor * height) /
            height);

    final firstChildOpacity = firstChildHeightFactor;
    final secondChildOpacity = 0.62 - (firstChildHeightFactor - 0.62);
    return GestureDetector(
      onPanStart: (d) => _panStart(
        details: d,
        transformMatrix: transformMatrix,
        cardHeight: height,
        cardWidth: width,
        animationController: animationController,
        holdDownOffset: holdDownOffset,
      ),
      onPanUpdate: (d) => _panUpdate(
        details: d,
        translationOffset: translationOffset,
        rotationAngle: rotationAngle,
        cardHeight: height,
        currentDy: currentDy,
        hasCrossed: hasCrossed,
        holdDownOffset: holdDownOffset,
      ),
      onPanEnd: (d) => _panEnd(
        details: d,
        cardHeight: height,
        animationController: animationController,
        transformMatrix: transformMatrix,
        currentDy: currentDy,
        dyAtAnimationStart: dyAtAnimationStart,
        holdDownOffset: holdDownOffset,
      ),
      child: Transform(
        alignment: Alignment.center,
        transform: transformMatrix.value,
        child: Transform.rotate(
          angle: rotationAngle.value,
          child: Transform.translate(
            offset: translationOffset.value,
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 5),
                    ],
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: secondChildHeightFactor *
                                      constraints.maxHeight),
                              child: Opacity(
                                opacity: secondChildOpacity.clamp(0.0, 1.0),
                                child: secondChild,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: ClipPath(
                              clipper: NinjaClip(
                                width: constraints.maxWidth,
                                maxHeight: firstChildHeightFactor *
                                    constraints.maxHeight,
                                minHeight: firstChildHeightFactor *
                                    constraints.maxHeight /
                                    0.62 *
                                    0.38,
                              ),
                              child: Container(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: firstChildHeightFactor *
                                      constraints.maxHeight),
                              child: ClipPath(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                clipper: NinjaClip(
                                  width: constraints.maxWidth,
                                  maxHeight: firstChildHeightFactor *
                                      constraints.maxHeight,
                                  minHeight: firstChildHeightFactor *
                                      constraints.maxHeight /
                                      0.62 *
                                      0.38,
                                ),
                                child: Opacity(
                                  opacity: firstChildOpacity.clamp(0.0, 1.0),
                                  child: firstChild,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _panStart({
    required DragStartDetails details,
    required ValueNotifier<Matrix4> transformMatrix,
    required double cardWidth,
    required double cardHeight,
    required AnimationController animationController,
    required ValueNotifier<Offset> holdDownOffset,
  }) {
    animationController.stop();
    holdDownOffset.value = details.globalPosition;
    final localX = details.localPosition.dx;
    final localY = details.localPosition.dy;
    final pressureFactor = 0.1;
    final angleX = (0.5 - (localX / cardWidth)) * pressureFactor;
    final angleY = -(0.5 - (localY / cardHeight)) * pressureFactor;
    transformMatrix.value = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angleX)
      ..rotateX(angleY);
  }

  void _panUpdate({
    required DragUpdateDetails details,
    required ValueNotifier<Offset> translationOffset,
    required ValueNotifier<double> rotationAngle,
    required double cardHeight,
    required ValueNotifier<double> currentDy,
    required ValueNotifier<bool> hasCrossed,
    required ValueNotifier<Offset> holdDownOffset,
  }) {
    currentDy.value = (details.globalPosition - holdDownOffset.value).dy;
    if (currentDy.value.abs() > 0.1 * cardHeight && !hasCrossed.value) {
      hasCrossed.value = true;
      HapticFeedback.lightImpact();
    } else if (currentDy.value.abs() < 0.1 * cardHeight) {
      hasCrossed.value = false;
    }
    _updatePosition(
      translationOffset: translationOffset,
      rotationAngle: rotationAngle,
      cardHeight: cardHeight,
      currentDy: currentDy,
      deltaY: currentDy.value,
    );
  }

  void _updatePosition({
    required ValueNotifier<Offset> translationOffset,
    required ValueNotifier<double> rotationAngle,
    required double cardHeight,
    required double deltaY,
    required ValueNotifier<double> currentDy,
  }) {
    rotationAngle.value = math.asin(-deltaY.abs() / cardHeight);
    translationOffset.value = Offset(0, deltaY);
  }

  void _panEnd({
    required DragEndDetails details,
    required double cardHeight,
    required AnimationController animationController,
    required ValueNotifier<Matrix4> transformMatrix,
    required ValueNotifier<double> currentDy,
    required ValueNotifier<double> dyAtAnimationStart,
    required ValueNotifier<Offset>? holdDownOffset,
  }) {
    dyAtAnimationStart.value = currentDy.value;
    animationController.duration = Duration(milliseconds: 400);
    animationController.reset();
    animationController.forward();
    holdDownOffset = null;
    transformMatrix.value = Matrix4.identity();
  }
}

class NinjaClip extends CustomClipper<Path> {
  final double width;
  final double minHeight;
  final double maxHeight;

  NinjaClip({
    required this.width,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(width, 0)
      ..lineTo(width, minHeight)
      ..lineTo(0, maxHeight)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
