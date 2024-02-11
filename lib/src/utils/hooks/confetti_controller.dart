import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ConfettiController useConfettiController({required Duration duration}) {
  return use(_ConfettiControllerHook(duration: duration));
}

class _ConfettiControllerHook extends Hook<ConfettiController> {
  const _ConfettiControllerHook({List<Object?>? keys, required this.duration})
      : super(keys: keys);
  final Duration duration;

  @override
  HookState<ConfettiController, _ConfettiControllerHook> createState() =>
      __ConfettiControllerHookState();
}

class __ConfettiControllerHookState
    extends HookState<ConfettiController, _ConfettiControllerHook> {
  late final ConfettiController _controller =
      ConfettiController(duration: hook.duration);
  @override
  ConfettiController build(BuildContext context) {
    print(_controller);
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
  }
}
