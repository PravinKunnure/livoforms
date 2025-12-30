import 'package:flutter/material.dart';
import 'package:reactive_orm_forms/reactive_orm_forms.dart';
import '../reactive_form_field.dart';

class ReactiveDropdown<T> extends ReactiveFormField<T> {
  final List<DropdownMenuItem<T>> items;
  final String? hint;

  const ReactiveDropdown({
    required super.model,
    required super.fieldName,
    required this.items,
    this.hint,
    super.validator,
    super.key,
  });

  @override
  ReactiveDropdownState<T> createState() => ReactiveDropdownState<T>();
}

class ReactiveDropdownState<T> extends State<ReactiveDropdown<T>> {
  T? get value => widget.model.getField(Symbol(widget.fieldName));
  set value(T? val) => widget.model.setField(Symbol(widget.fieldName), val);

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_onChange, field: Symbol(widget.fieldName));
  }

  void _onChange() => setState(() {});

  @override
  void dispose() {
    widget.model.removeListener(_onChange, field: Symbol(widget.fieldName));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      hint: widget.hint != null ? Text(widget.hint!) : null,
      items: widget.items,
      onChanged: (v) => value = v,
    );
  }
}
