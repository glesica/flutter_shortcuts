import 'package:flutter/material.dart';

class FullscreenChoiceDialog<T extends ChoiceModel> extends StatelessWidget {
  final Iterable<T> models;

  final String title;

  FullscreenChoiceDialog({
    @required this.models,
    @required this.title,
    Key key,
  })  : assert(models != null),
        assert(title != null),
        super(key: key);

  /// Helper to display the [FullscreenChoiceDialog] using
  /// [showDialog] and return the resulting value wrapped
  /// in a [Future].
  static Future<T> show<T extends ChoiceModel>({
    @required BuildContext context,
    @required Iterable<T> models,
    @required String title,
  }) async {
    assert(context != null);
    assert(models != null);
    assert(title != null);

    final widget = FullscreenChoiceDialog(
      models: models,
      title: title,
    );

    return showDialog<T>(
      context: context,
      builder: (context) => widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(title),
      ),
      body: _listView(context),
    );
  }

  Widget _listTile(BuildContext context, T model) {
    return ListTile(
      key: Key(model.hashCode.toString()),
      onTap: () => _handleChoice(context, model),
      subtitle: Text(model.subtitle ?? ''),
      title: Text(model.title),
    );
  }

  Widget _listView(BuildContext context) {
    final modelsList = models.toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return _listTile(context, modelsList[index]);
      },
      itemCount: modelsList.length,
    );
  }

  void _handleChoice(BuildContext context, T model) {
    Navigator.of(context).pop<T>(model);
  }
}

abstract class ChoiceModel {
  String get subtitle;
  String get title;

  factory ChoiceModel.simple({
    @required String title,
    String subtitle,
  }) {
    assert(title != null);
    return _ChoiceModel(title, subtitle);
  }
}

class _ChoiceModel implements ChoiceModel {
  final String subtitle;
  final String title;

  _ChoiceModel(this.title, this.subtitle);

  @override
  String toString() => title;
}
