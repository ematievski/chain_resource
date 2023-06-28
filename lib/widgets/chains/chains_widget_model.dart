import 'package:flutter/material.dart';

class ChainsWidgetModel extends ChangeNotifier {}

class ChainsWidgetModelProwider extends InheritedNotifier {
  final ChainsWidgetModel model;
  const ChainsWidgetModelProwider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static ChainsWidgetModelProwider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChainsWidgetModelProwider>();
  }

  static ChainsWidgetModelProwider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChainsWidgetModelProwider>()
        ?.widget;
    return widget is ChainsWidgetModelProwider ? widget : null;
  }
}
