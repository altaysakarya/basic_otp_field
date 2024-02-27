import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicOTPInput extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final int length;
  final bool expandable;
  final Size? inputSize;
  final EdgeInsets? inputPadding;
  final InputBorder? generalBorder; //Change all borders
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool showHintText;
  final MainAxisAlignment? mainAxisAlignment;
  final ValueSetter<String>? onCompleted;
  const BasicOTPInput({
    Key? key,
    this.formKey,
    this.length = 4,
    this.expandable = false,
    this.inputSize,
    this.inputPadding,
    this.generalBorder,
    this.border,
    this.errorBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.showHintText = true,
    this.hintText,
    this.hintStyle,
    this.mainAxisAlignment,
    this.onCompleted,
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
    if (index == widget.length - 1 && value.length == 1) {
      String otpValue = _controllers.map((e) => e.text).join();
      widget.onCompleted?.call(otpValue);
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
          return Expanded(
            flex: widget.expandable ? 1 : 0,
            child: Container(
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
                  hintStyle: widget.hintStyle ?? const TextStyle(fontWeight: FontWeight.bold),
                  border: widget.generalBorder ??
                      widget.border ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(.3),
                        ),
                      ),
                  enabledBorder: widget.generalBorder ??
                      widget.enabledBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(.3),
                        ),
                      ),
                  focusedBorder: widget.generalBorder ??
                      widget.focusedBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(.3),
                        ),
                      ),
                  errorBorder: widget.generalBorder != null
                      ? widget.generalBorder?.copyWith(borderSide: widget.generalBorder?.borderSide.copyWith(color: Colors.red))
                      : widget.errorBorder ??
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
