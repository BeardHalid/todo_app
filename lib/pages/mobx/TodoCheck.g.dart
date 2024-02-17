// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoCheck.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoCheck on TodoCheckBase, Store {
  late final _$checkedAtom =
      Atom(name: 'TodoCheckBase.checked', context: context);

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  late final _$TodoCheckBaseActionController =
      ActionController(name: 'TodoCheckBase', context: context);

  @override
  void setTrue() {
    final _$actionInfo = _$TodoCheckBaseActionController.startAction(
        name: 'TodoCheckBase.setTrue');
    try {
      return super.setTrue();
    } finally {
      _$TodoCheckBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFalse() {
    final _$actionInfo = _$TodoCheckBaseActionController.startAction(
        name: 'TodoCheckBase.setFalse');
    try {
      return super.setFalse();
    } finally {
      _$TodoCheckBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checked: ${checked}
    ''';
  }
}
