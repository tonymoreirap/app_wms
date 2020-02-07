

import 'dart:async';

mixin Validatores{

  var senhaValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (senha, sink){
      if(senha.length >=4){
        sink.add(senha);
      } else {
        sink.addError('Senha deve conter mais de 4 caracteres');
      }
    }
  );
}