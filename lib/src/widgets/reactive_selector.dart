import 'package:flutter/material.dart';
import 'package:reactive_orm_forms/reactive_orm_forms.dart';

class ReactiveSelectorF<T> extends StatefulWidget {
  final ReactiveModel model;
  final String fieldName;
  final List<T> items;
  final String Function(T)? labelBuilder;

  const ReactiveSelectorF({
    required this.model,
    required this.fieldName,
    required this.items,
    this.labelBuilder,
    super.key,
  });

  @override
  State<ReactiveSelectorF<T>> createState() => _ReactiveSelectorFState<T>();
}

class _ReactiveSelectorFState<T> extends State<ReactiveSelectorF<T>> {
  T? get modelValue => widget.model.getField(Symbol(widget.fieldName)) as T?;
  set modelValue(T? value) =>
      widget.model.setField(Symbol(widget.fieldName), value);

  void _onModelChange() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_onModelChange, field: Symbol(widget.fieldName));
  }

  @override
  void dispose() {
    widget.model.removeListener(
      _onModelChange,
      field: Symbol(widget.fieldName),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: modelValue,
      isExpanded: true,
      items: widget.items
          .map(
            (e) => DropdownMenuItem<T>(
              value: e,
              child: Text(widget.labelBuilder?.call(e) ?? e.toString()),
            ),
          )
          .toList(),
      onChanged: (v) => modelValue = v,
    );
  }
}
