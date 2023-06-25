import 'package:chain_resource/widgets/chain_form/chain_form_widget_model.dart';
import 'package:flutter/material.dart';

class ChainFormWidget extends StatefulWidget {
  const ChainFormWidget({Key? key}) : super(key: key);

  @override
  State<ChainFormWidget> createState() => _ChainFormWidgetState();
}

class _ChainFormWidgetState extends State<ChainFormWidget> {
  final _model = ChainFormWidgetModel();

  @override
  Widget build(BuildContext context) {
    return ChainFormWidgetModelProwider(
      model: _model,
      child: const _ChainFormWidgetBody(),
    );
  }
}

class _ChainFormWidgetBody extends StatelessWidget {
  const _ChainFormWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('новая цепь'),
      ),
      body: Center(
        child: Container(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _ChainNameWidget(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ChainFormWidgetModelProwider.read(context)
            ?.model
            .saveChain(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}

class _ChainNameWidget extends StatelessWidget {
  const _ChainNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ChainFormWidgetModelProwider.read(context)?.model;
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Название новой цепи'),
      onChanged: (value) => model?.chainName = value,
      onEditingComplete: () => model?.saveChain(context),
    );
  }
}
