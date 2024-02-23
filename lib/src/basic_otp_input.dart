import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicOTPInput extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final int length;
  final Size? inputSize;
  final EdgeInsets? inputPadding;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final String? hintText;
  final bool showHintText;
  final MainAxisAlignment? mainAxisAlignment;
  const BasicOTPInput({
    Key? key,
    this.formKey,
    this.length = 4,
    this.inputSize,
    this.inputPadding,
    this.border,
    this.errorBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.showHintText = true,
    this.hintText,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  _BasicOTPInputState createState() => _BasicOTPInputState();
}

class _BasicOTPInputState extends State<BasicOTPInput> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers = List.generate(widget.length, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _nextField({required String value, required int index}) {
    if (value.length == 1 && index + 1 < widget.length) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index - 1 >= 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String? _validate(String? value) {
    if (value?.isEmpty ?? true) return ' ';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
        children: List.generate(widget.length, (index) {
          return Container(
            width: widget.inputSize?.width ?? 70,
            height: widget.inputSize?.height ?? 70,
            padding: widget.inputPadding ?? const EdgeInsets.all(4),
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              autofocus: index == 0,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              validator: _validate,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              onChanged: (value) => _nextField(value: value, index: index),
              decoration: InputDecoration(
                hintText: widget.hintText ?? '0',
                border: widget.border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                enabledBorder: widget.enabledBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                focusedBorder: widget.focusedBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                errorBorder: widget.errorBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
              ),
            ),
          );
        }),
      ),
    );
  }
}