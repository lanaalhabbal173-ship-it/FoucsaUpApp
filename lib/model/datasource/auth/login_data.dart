import 'package:test/core/class/crud.dart';
import 'package:test/linkapi.dart';

class LoginData {
  final Crud crud;

  LoginData(this.crud);

  Future<dynamic> postData(Map<String, dynamic> data) async {
    var response = await crud.postData(AppLink.login, data);

    return response.fold((l) => l, (r) => r);
  }
}
