import 'dart:convert';

import 'package:ouvinte_cidadao/infra/request/api.dart';

class ServLogin {
  static login({required String email, required String senha}) async {
    final data = {'email': email, 'password': senha};
    final result = await Api().postRequest(route: 'api/', data: data);

    print(jsonDecode(result.body));
  }
}
