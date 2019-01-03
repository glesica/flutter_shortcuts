import 'package:flutter/material.dart';

/// A simple modal that contains a title, a single [TextField],
/// a button that submits the value, and a button that cancels
/// the modal.
///
/// Additionally, there are a number of optional parameters that
/// can change the appearance or behavior of the modal.
class TextInputModal extends StatefulWidget {
  TextInputModal({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class TextInputModalState extends State<TextInputModal> {
  String _textInputValue = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: <Widget>[
          //
        ],
      ),
    );
  }

  Widget _cancelButton() {
    return FlatButton(
      child: const Text('Cancel'),
      key: Key('cancelButton'),
      onPressed: _handleCancel,
    );
  }

  void _handleCancel() {
    Navigator.of(context).pop(null);
  }

  void _handleSubmit() {
    Navigator.of(context).pop(_textInputValue);
  }

  Widget _okButton() {
    return FlatButton(
      child: const Text('OK'),
      key: Key('okButton'),
      onPressed: _handleSubmit,
    );
  }

  Widget _textInput() {
    return TextField(
      autofocus: true,
      key: Key('textInput'),
      onChanged: (value) {
        _textInputValue = value;
      },
      onSubmitted: (value) {
        _textInputValue = value;
        _handleSubmit();
      },
    );
  }
}
