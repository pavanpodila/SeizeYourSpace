import 'package:mobx/mobx.dart';

part 'details_store.g.dart';

class Details = _Details with _$Details;

abstract class _Details implements Store {
  @observable
  String name;

  @observable
  String email;

  @observable
  String phone;

  @action
  void setName(String value) {
    this.name = value;
  }

  @action
  void setEmail(String value) {
    this.email = value;
  }

  @action
  void setPhone(String value) {
    this.phone = value;
  }
}
