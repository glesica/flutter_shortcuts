import 'package:flutter/material.dart';
import 'package:flutter_shortcuts_example/dialogs.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shortcuts Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shortcuts Example'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Dialogs Examples'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DialogsExamples();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
