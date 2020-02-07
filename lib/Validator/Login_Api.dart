import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/*loginApi() async {

  String username = 'developer';
  String password = 'l@gtech';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  var response = await http.post(
    'http://192.168.1.2:8080/datasnap/rest/TSMServer/login/Admin/9631',
    headers: <String, String>{'authorization': basicAuth},
    body: {'name': 'doodle', 'color': 'blue'},
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

}*/

loginAPI(user, pass) async {
  String username = 'developer';
  String password = 'l@gtech';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);
  print(">>> USUARIO: $user SENHA: $pass");
  var url = 'http://192.168.1.2:8080/datasnap/rest/TSMServer/login/$user/$pass';
  print(">>> urk: $url");

  Response r = await get(
      'http://192.168.1.2:8080/datasnap/rest/TSMServer/login/$user/$pass',
      headers: <String, String>{'authorization': basicAuth});
  if (r.statusCode == 200) {
    print(r.statusCode);
  } else {
    print ("Usuário $user não cadastrado!!");
    throw Exception('Falha na conexão ');
  }
  print(r.body);
}
