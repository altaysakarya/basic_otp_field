# BasicOTPInput Widget

The `BasicOTPInput` widget is a customizable One Time Password (OTP) input widget for Flutter applications. It allows for a flexible and user-friendly way to input OTP codes. The widget is designed to be highly customizable, with support for various styles, lengths, and layouts.

## Features

- **Customizable Length**: Set the OTP length according to your needs (default is 4).
- **Flexible Sizing**: Customize the size of the input fields with `inputSize`.
- **Custom Padding**: Adjust the padding inside the input fields using `inputPadding`.
- **Customizable Borders**: Define custom borders, focused borders, enabled borders, and error borders for the input fields.
- **Hint Text**: Option to show hint text inside the input fields. This can be turned on or off.
- **Customizable Layout**: Align the OTP input fields using `mainAxisAlignment`.

## Usage

To use the `BasicOTPInput` widget, simply include it in your widget tree and configure its properties according to your needs.

```dart
BasicOTPInput(
  formKey: GlobalKey<FormState>(),
  length: 6,
  inputSize: Size(50, 50),
  inputPadding: EdgeInsets.all(8),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  hintText: '0',
  showHintText: true,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
)
```

## Parameters

* `formKey`: (Optional) Global key to control the form state outside the widget.
* `length`: The length of the OTP (default is 4).
* `inputSize`: (Optional) Size of each input field.
* `inputPadding`: (Optional) Padding inside each input field.
* `border`: (Optional) Default border for the input fields.
* `focusedBorder`: (Optional) Border of the input field when focused.
* `enabledBorder`: (Optional) Border of the input field when enabled.
* `errorBorder`: (Optional) Border of the input field when an error occurs.
* `hintText`: (Optional) Text to display when the input field is empty.
* `showHintText`: Whether to show the hint text.
* `mainAxisAlignment`: (Optional) Alignment of the input fields in the row.

## Customization

The BasicOTPInput widget is designed to be highly customizable. Feel free to experiment with the parameters to match the style of your application.

For detailed customization and more advanced use cases, consider extending the widget or creating a custom widget based on this template.

## LICENSE

This `BasicOTPField` widget is provided under the MIT License.