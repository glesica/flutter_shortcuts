import 'package:flutter/material.dart';
import 'package:flutter_shortcuts/flutter_shortcuts.dart';

class DialogsExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listView = ListView(
      children: <Widget>[
        ListTile(
          title: const Text('FullscreenChoiceDialog'),
          onTap: () async {
            final choice = await FullscreenChoiceDialog.show(
              context: context,
              models: <ChoiceModel>[
                ChoiceModel.simple(title: 'Red'),
                ChoiceModel.simple(title: 'Black'),
                ChoiceModel.simple(title: 'Blue'),
                ChoiceModel.simple(title: 'Yellow'),
                ChoiceModel.simple(title: 'Grey'),
                ChoiceModel.simple(title: 'Green'),
                ChoiceModel.simple(title: 'Orange'),
                ChoiceModel.simple(title: 'White'),
                ChoiceModel.simple(title: 'Pink'),
                ChoiceModel.simple(title: 'Teal'),
              ],
              title: 'Choose a Value',
            );
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Your Choice'),
                    content: Text(choice?.toString() ?? 'null'),
                  );
                });
          },
        ),
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
                  content: Text(value ?? 'null'),
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
