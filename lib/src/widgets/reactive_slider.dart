import 'package:flutter/material.dart';
import 'package:reactive_orm_forms/reactive_orm_forms.dart';

class ReactiveSlider extends StatefulWidget {
  final ReactiveModel model;
  final String fieldName;
  final double min;
  final double max;
  final int? divisions;

  const ReactiveSlider({
    required this.model,
    required this.fieldName,
    this.min = 0,
    this.max = 100,
    this.divisions,
    super.key,
  });

  @override
  State<ReactiveSlider> createState() => _ReactiveSliderState();
}

class _ReactiveSliderState extends State<ReactiveSlider> {
  double get modelValue =>
      (widget.model.getField(Symbol(widget.fieldName)) as double?) ??
      widget.min;
  set modelValue(double val) =>
      widget.model.setField(Symbol(widget.fieldName), val);

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
    return Slider(
      value: modelValue,
      min: widget.min,
      max: widget.max,
      divisions: widget.divisions,
      label: modelValue.toStringAsFixed(1),
      onChanged: (v) => modelValue = v,
    );
  }
}
