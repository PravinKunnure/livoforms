import 'package:flutter/material.dart';
import 'package:reactive_orm_forms/reactive_orm_forms.dart';
import '../reactive_form_field.dart';

class ReactiveCheckbox extends ReactiveFormField<bool> {
  const ReactiveCheckbox({
    required super.model,
    required super.fieldName,
    super.validator,
    super.key,
  });

  @override
  ReactiveCheckboxState createState() => ReactiveCheckboxState();
}

class ReactiveCheckboxState extends State<ReactiveCheckbox> {
  bool get value => widget.model.getField(Symbol(widget.fieldName)) ?? false;

  set value(bool val) => widget.model.setField(Symbol(widget.fieldName), val);

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_onChange, field: Symbol(widget.fieldName));
  }

  void _onChange() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.model.removeListener(_onChange, field: Symbol(widget.fieldName));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: (v) => value = v!);
  }
}
