import 'package:flutter/material.dart';
import 'package:reactive_orm/reactive_orm.dart';

typedef Validator<T> = String? Function(T value);

abstract class ReactiveFormField<T> extends StatefulWidget {
  final ReactiveModel model;
  final String fieldName;
  final Validator<T>? validator;

  const ReactiveFormField({
    required this.model,
    required this.fieldName,
    this.validator,
    super.key,
  });
}
