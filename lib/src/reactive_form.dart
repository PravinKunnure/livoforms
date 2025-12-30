import 'package:flutter/material.dart';

class ReactiveForm extends StatelessWidget {
  final List<Widget> children;

  const ReactiveForm({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: children);
  }
}
