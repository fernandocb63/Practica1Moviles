import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:practica1/home_page.dart';

part 'hora_event.dart';
part 'hora_state.dart';
var paises={
    0: "Europe/Andorra",
    1: "America/Mexico_City",
    3: "America/Lima",
    4: "America/Vancouver",
    5: "America/Argentina/Salta",
    6: "Europe/Kiev"
};
var Npaises={
    0: "Andorra",
    1: "Mexico",
    3: "Peru",
    4: "Canda",
    5: "Argentina",
    6: "Ukrania"
};



class HoraBloc extends Bloc<HoraEvent, HoraState> {
  HoraBloc() : super(HoraInitial()) {
    on<HoraCambiar>(horacambiar);
  }
  void horacambiar(HoraCambiar event, Emitter emitter) async{
    var hora = await _pickHour(event.pais);
    var Npais = Npaises[event.pais];
    if (hora == null){
      emitter(HoraErrorState(errorMsg: "Error"));
    } else {
      emitter(HoraSelected(tiempo: hora['datetime'], pais: Npais ?? ""));
    }
  }

  Future _pickHour(int paisIndex) async {
    try {
      http.Response res = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/${paises[paisIndex]}"));
      if(res.statusCode == HttpStatus.ok)
        return jsonDecode(res.body);
    } catch (e) {print(e);}
  }

}
