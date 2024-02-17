import 'package:mobx/mobx.dart';

part 'TodoCheck.g.dart';

class TodoCheck = TodoCheckBase with _$TodoCheck;

abstract class TodoCheckBase with Store{
  @observable
  bool checked = false;

  @action
  void setValue(bool value){
    checked = value;
  }
}