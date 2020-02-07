/*
import 'dart:async';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';

enum Conf_Abs_Event {incrementa, decrementa}

class Conf_Abastecimento_Bloc extends Bloc <Conf_Abs_Event, int>{



  @override
  get initialState => 0;

  @override
  Stream<int> mapEventToState(Conf_Abs_Event event) async* {
    if (event == Conf_Abs_Event.incrementa){
      yield state +1;
    } else if (event == Conf_Abs_Event.decrementa){
      if(state > 0) yield state - 1;
    }
  }


}*/
