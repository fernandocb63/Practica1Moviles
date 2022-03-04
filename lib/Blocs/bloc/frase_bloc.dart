import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'frase_event.dart';
part 'frase_state.dart';



class FraseBloc extends Bloc<FraseEvent, FraseState> {
  FraseBloc() : super(FraseInitial()) {
    on<FraseEvent>(FraseCambiar);
  }
  void FraseCambiar(FraseEvent event, Emitter emitter) async{
    var frase = await _pickFrase();
    var autor = await _pickFrase();
    if (frase == null && autor == null){
      emitter(FraseErrorState(errorMsg: "Error"));
    } else {
      emitter(FraseSelected(frasemap: frase[0]['q'], autormap: autor[0]['a']));
    }
  }

  Future _pickFrase() async {
    try {
      http.Response res = await http.get(Uri.parse("https://zenquotes.io/api/random/"));
      if(res.statusCode == HttpStatus.ok)
        return jsonDecode(res.body);
    } catch (e) {print(e);}
  }

}
