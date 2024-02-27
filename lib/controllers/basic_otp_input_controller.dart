import 'package:flutter/material.dart';

class BasicOTPInputController {
  late final TextEditingController _tec;
  late final FocusNode _focusNode;
  late final int length;

  BasicOTPInputController({required this.length}) {
    _tec = TextEditingController();
    _focusNode = FocusNode();
  }

  TextEditingController get tec => _tec;
  FocusNode get focusNode => _focusNode;

  String get otp => _tec.text;
  bool get isCompleted => _tec.text.length == length;

  void clear() {
    tec.clear();
  }

  void dispose() {
    tec.dispose();
  }
}
