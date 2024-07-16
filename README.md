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
  controller: BasicOTPInputController(length: 6),
  expandable: true,
  autofocus: true,
  inputSize: Size(50, 50),
  inputInPadding: EdgeInsets.all(8),
  inputOutPadding: EdgeInsets.all(4),
  border: Border.all(color: Colors.grey),
  focusedBorder: Border.all(color: Colors.blue),
  borderRadius: BorderRadius.circular(8.0),
  hintText: '0',
  showHintText: true,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  onCompleted: (String value) {
    // Handle completion
  },
  onChanged: (String value) {
    // Handle change
  },
)
```

## Parameters

* `formKey`: (Optional) Global key to control the form state outside the widget.
* `controller`: An instance of BasicOTPInputController, required to manage the OTP input.
* `expandable`: (Optional) If set to true, the input fields will expand to fill available space. Defaults to false.
* `autofocus`: (Optional) Whether the OTP field should be focused automatically.
* `inputSize`: (Optional) Size of each input field.
* `inputInPadding`: (Optional) Inner padding for the input field containers.
* `inputOutPadding`: (Optional) Outer padding around the input field containers.
* `border`: (Optional) Default border for the input fields.
* `focusedBorder`: (Optional) Border of the input field when focused.
* `borderRadius`: (Optional) Border radius of the input fields.
* `backgroundColor`: (Optional) Change background color.
* `hintText`: (Optional) Text to display when the input field is empty.
* `showHintText`: Whether to show the hint text inside the input fields.
* `mainAxisAlignment`: (Optional) Alignment of the input fields in their container.
* `onCompleted`: (Optional) Callback when the user has entered the full OTP.
* `onChanged`: (Optional) Callback for when the value of an input field changes.

## Customization

The BasicOTPInput widget is designed to be highly customizable. Feel free to experiment with the parameters to match the style of your application.

For detailed customization and more advanced use cases, consider extending the widget or creating a custom widget based on this template.

## LICENSE

This `BasicOTPField` widget is provided under the MIT License.