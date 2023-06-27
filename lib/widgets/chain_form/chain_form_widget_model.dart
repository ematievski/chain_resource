import 'package:chain_resource/domain/entity/chain.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChainFormWidgetModel {
  var chainName = '';
  void saveChain(BuildContext context) async {
    if (chainName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChainAdapter());
    }
    final box = await Hive.openBox<Chain>('chains_box');
    final chain = Chain(name: chainName);
    await box.add(chain);
    Navigator.of(context).pop();
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
