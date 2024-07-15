import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ouvinte_cidadao/infra/exceptions.dart';

Future<http.Response> requisicaoPost(
    {required String endPoint, Object? body}) async {
  final url = Uri.parse(endPoint);

  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body));

  if (response.statusCode == 201) {
    return response;
  } else if (response.statusCode == 500) {
    throw ESemInternet();
  } else {
    throw Exception(response.body);
  }
}
