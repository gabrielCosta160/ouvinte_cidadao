import 'dart:convert';

import 'package:ouvinte_cidadao/infra/consts.dart';
import 'package:http/http.dart' as http;

class Api {
  postRequest({
    required String route,
    required Map<String, dynamic> data,
  }) async {
    String url = apiUrl + route;
    return await http.post(Uri.parse(url),
        body: jsonEncode(data));
  }
}
