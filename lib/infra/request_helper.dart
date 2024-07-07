import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> requisicaoPost(Uri url) async {
  // Cabeçalhos da requisição
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer seu_token', // Ajuste o token conforme necessário
  };

  try {
    // Envio da requisição
    final response = await http.post(
      url,
      headers: headers,
    );

    // Verifica o status da resposta
    if (response.statusCode == 200) {
      // Se a requisição foi bem-sucedida
      print('Resposta: ${response.body}');
    } else {
      // Se ocorreu algum erro
      print('Erro: ${response.statusCode}');
      print('Resposta: ${response.body}');
    }
  } catch (e) {
    // Trata exceções
    print('Ocorreu um erro: $e');
  }
}