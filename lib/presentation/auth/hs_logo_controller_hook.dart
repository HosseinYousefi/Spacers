import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'auth_view.dart';

HSLogoController useHSLogoController() {
  return use(_HSLogoControllerHook());
}

class _HSLogoControllerHook extends Hook<HSLogoController> {
  @override
  HookState<HSLogoController, Hook<HSLogoController>> createState() =>
      _HSLogoControllerHookState();
}

class _HSLogoControllerHookState
    extends HookState<HSLogoController, _HSLogoControllerHook> {
  late final HSLogoController _hsLogoController = HSLogoController();

  @override
  HSLogoController build(BuildContext context) {
    return _hsLogoController;
  }

  @override
  void dispose() {
    _hsLogoController.dispose();
    super.dispose();
  }
}
