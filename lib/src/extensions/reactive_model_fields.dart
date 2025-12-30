import 'package:reactive_orm/reactive_orm.dart';

extension ReactiveModelFields on ReactiveModel {
  /// Get value dynamically by field Symbol
  dynamic getField(Symbol field) {
    final name = _symbolToString(field);
    final json = (this as dynamic).toJson();
    return json[name];
  }

  /// Set value dynamically by field Symbol
  void setField(Symbol field, dynamic value) {
    final name = _symbolToString(field);
    (this as dynamic).fromJson({name: value});
    notifyListeners(field);
  }

  /// Helper to convert Symbol to String
  String _symbolToString(Symbol s) =>
      s.toString().replaceAll('Symbol("', '').replaceAll('")', '');
}
