import 'package:flutter/material.dart';

/// A simple dialog that contains a title, a single [TextField],
/// an "OK" button, and a "CANCEL" button.
///
/// If the "OK" button is pressed then the popped value will be
/// the contents of the text field. If the "CANCEL" button is
/// pressed or the dialog is otherwise dismissed, then the popped
/// value will be `null`.
///
/// Additionally, there are a number of optional parameters that
/// can change the appearance or behavior of the dialog.
///
/// Note that the popped string might be empty if the user pressed
/// "OK" while the text field was empty.
class TextFieldDialog extends StatelessWidget {
  final TextEditingController controller;

  /// The title used for the dialog, shown above the text field.
  final String title;

  TextFieldDialog({
    @required this.title,
    String initialText,
    Key key,
  })  : assert(title != null),
        controller = TextEditingController(text: initialText ?? ''),
        super(key: key);

  /// Helper to display the [TextFieldDialog] using [showDialog]
  /// and return the resulting value wrapped in a [Future].
  static Future<String> show({
    @required BuildContext context,
    @required String title,
    String initialText,
  }) async {
    assert(context != null);
    assert(title != null);

    final widget = TextFieldDialog(
      title: title,
      initialText: initialText,
    );

    return showDialog<String>(
      context: context,
      builder: (context) => widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      children: <Widget>[
        _textField(context),
        _buttonBar(context),
      ],
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buttonBar(BuildContext context) {
    return ButtonTheme.bar(
      child: ButtonBar(
        alignment: MainAxisAlignment.end,
        children: <Widget>[
          _cancelButton(context),
          _okButton(context),
        ],
      ),
      key: Key('buttons'),
    );
  }

  Widget _cancelButton(BuildContext context) {
    return FlatButton(
      child: const Text('CANCEL'),
      key: Key('cancel'),
      onPressed: () => _handleCancel(context),
    );
  }

  void _handleCancel(BuildContext context) {
    Navigator.of(context).pop(null);
  }

  void _handleOk(BuildContext context) {
    Navigator.of(context).pop(controller.text);
  }

  Widget _okButton(BuildContext context) {
    return FlatButton(
      child: const Text('OK'),
      key: Key('ok'),
      onPressed: () => _handleOk(context),
    );
  }

  Widget _textField(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: '',
        ),
        onSubmitted: (_) => _handleOk(context),
      ),
      key: Key('field'),
      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
    );
  }
}
