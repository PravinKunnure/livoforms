import 'package:flutter/material.dart';
import 'package:reactive_orm_forms/reactive_orm_forms.dart';
import '../reactive_form_field.dart';

class ReactiveTextField extends ReactiveFormField<String> {
  final String? hintText;

  const ReactiveTextField({
    required super.model,
    required super.fieldName,
    super.validator,
    this.hintText,
    super.key,
  });

  @override
  ReactiveTextFieldState createState() => ReactiveTextFieldState();
}

class ReactiveTextFieldState extends State<ReactiveTextField> {
  late TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.model.getField(Symbol(widget.fieldName)) ?? '',
    );

    widget.model.addListener(_onModelChange, field: Symbol(widget.fieldName));
    _controller.addListener(() {
      widget.model.setField(Symbol(widget.fieldName), _controller.text);
      _validate();
    });

    _validate();
  }

  void _onModelChange() {
    if (_controller.text != widget.model.getField(Symbol(widget.fieldName))) {
      _controller.text = widget.model.getField(Symbol(widget.fieldName)) ?? '';
    }
  }

  void _validate() {
    if (widget.validator != null) {
      setState(() {
        _error = widget.validator!(_controller.text);
      });
    }
  }

  @override
  void dispose() {
    widget.model.removeListener(
      _onModelChange,
      field: Symbol(widget.fieldName),
    );
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(hintText: widget.hintText, errorText: _error),
    );
  }
}
