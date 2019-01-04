import 'package:flutter/material.dart';
import 'package:flutter_shortcuts/flutter_shortcuts.dart';

class DialogsExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listView = ListView(
      children: <Widget>[
        ListTile(
          title: const Text('TextFieldDialog'),
          onTap: () async {
            final value = await TextFieldDialog.show(
              context: context,
              title: 'Enter a Value',
            );
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Your Value'),
                  content: Text(value),
                );
              },
            );
          },
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Dialogs Example'),
      ),
      body: listView,
    );
  }
}
