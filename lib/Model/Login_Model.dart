


class Credenciais_Login {

  int codUsuario;
  String loginUsuario;

  Credenciais_Login({this.codUsuario, this.loginUsuario});

  Credenciais_Login.fromJson(Map<String, dynamic> json) {
    codUsuario = json['codUsuario'];
    loginUsuario = json['loginUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codUsuario'] = this.codUsuario;
    data['loginUsuario'] = this.loginUsuario;
    return data;
  }
}