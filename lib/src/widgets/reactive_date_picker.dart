import 'package:flutter/material.dart';
import 'package:reactive_orm_forms/reactive_orm_forms.dart';

class ReactiveDatePicker extends StatefulWidget {
  final ReactiveModel model;
  final String fieldName;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const ReactiveDatePicker({
    required this.model,
    required this.fieldName,
    this.firstDate,
    this.lastDate,
    super.key,
  });

  @override
  State<ReactiveDatePicker> createState() => _ReactiveDatePickerState();
}

class _ReactiveDatePickerState extends State<ReactiveDatePicker> {
  DateTime? get modelValue =>
      widget.model.getField(Symbol(widget.fieldName)) as DateTime?;
  set modelValue(DateTime? value) =>
      widget.model.setField(Symbol(widget.fieldName), value);

  void _onModelChange() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: modelValue ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
    );
    if (picked != null) modelValue = picked;
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
    return InkWell(
      onTap: _pickDate,
      child: InputDecorator(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        child: Text(
          modelValue != null
              ? modelValue!.toLocal().toString().split(' ')[0]
              : 'Select Date',
        ),
      ),
    );
  }
}
