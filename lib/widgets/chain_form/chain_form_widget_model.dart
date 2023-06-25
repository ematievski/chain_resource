import 'package:flutter/material.dart';

class ChainFormWidgetModel {
  var chainName = '';
  void saveChain(BuildContext context) {
    print(chainName);
  }
}

class ChainFormWidgetModelProwider extends InheritedWidget {
  final ChainFormWidgetModel model;
  const ChainFormWidgetModelProwider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static ChainFormWidgetModelProwider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChainFormWidgetModelProwider>();
  }

  static ChainFormWidgetModelProwider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChainFormWidgetModelProwider>()
        ?.widget;
    return widget is ChainFormWidgetModelProwider ? widget : null;
  }

  @override
  bool updateShouldNotify(ChainFormWidgetModelProwider oldWidget) {
    return true;
  }
}
