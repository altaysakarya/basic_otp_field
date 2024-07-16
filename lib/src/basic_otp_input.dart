// ignore_for_file: dead_code

import 'package:basic_otp_field/controllers/basic_otp_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicOTPInput extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final BasicOTPInputController controller;
  final bool expandable;
  final bool autofocus;
  final Size? inputSize;
  final EdgeInsets? inputInPadding;
  final EdgeInsets? inputOutPadding;
  final BoxBorder? border;
  final BoxBorder? focusedBorder;
  final BorderRadius? borderRadius;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool showHintText;
  final MainAxisAlignment? mainAxisAlignment;
  final ValueSetter<String>? onCompleted;
  final ValueSetter<String>? onChanged;
  final Color? backgroundColor;
  const BasicOTPInput({
    Key? key,
    this.formKey,
    required this.controller,
    this.expandable = false,
    this.autofocus = true,
    this.inputSize,
    this.inputInPadding,
    this.inputOutPadding,
    this.border,
    this.focusedBorder,
    this.borderRadius,
    this.showHintText = true,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.mainAxisAlignment,
    this.onCompleted,
    this.onChanged,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _BasicOTPInputState createState() => _BasicOTPInputState();
}

class _BasicOTPInputState extends State<BasicOTPInput> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    if (value?.isEmpty ?? true) return ' ';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.0,
            child: TextFormField(
              controller: widget.controller.tec,
              focusNode: widget.controller.focusNode,
              textAlign: TextAlign.center,
              autofocus: widget.autofocus,
              keyboardType: TextInputType.number,
              style: widget.textStyle,
              validator: _validate,
              maxLength: widget.controller.length,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                //LengthLimitingTextInputFormatter(1),
              ],
              onChanged: (value) {
                if (widget.onChanged != null) widget.onChanged!(value);
                if (widget.onCompleted != null && value.length == widget.controller.length) widget.onCompleted!(value);
              },
              //onChanged: (value) => _nextField(value: value, index: index),
            ),
          ),
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              if (!widget.controller.focusNode.hasFocus) {
                widget.controller.focusNode.requestFocus();
              }
            },
            child: Row(
              mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
              children: List.generate(
                widget.controller.length,
                (index) => Expanded(
                  flex: widget.expandable ? 1 : 0,
                  child: Padding(
                    padding: widget.inputOutPadding ?? const EdgeInsets.all(4.0),
                    child: Container(
                      width: widget.inputSize?.width ?? 70,
                      height: widget.inputSize?.height ?? 70,
                      decoration: BoxDecoration(
                        borderRadius: widget.borderRadius ?? BorderRadius.circular(12.0),
                        color: widget.backgroundColor,
                        border: widget.focusedBorder != null && index == widget.controller.tec.text.length
                            ? widget.focusedBorder
                            : widget.border ?? Border.all(color: Colors.black.withOpacity(.5)),
                      ),
                      child: Padding(
                        padding: widget.inputInPadding ?? const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            widget.controller.otp.length > index
                                ? widget.controller.otp[index]
                                : widget.showHintText
                                    ? widget.hintText ?? '0'
                                    : '',
                            style: widget.controller.otp.length > index ? widget.textStyle : widget.hintStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
