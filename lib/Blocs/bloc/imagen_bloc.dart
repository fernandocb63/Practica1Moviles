import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'imagen_event.dart';
part 'imagen_state.dart';

class ImagenBloc extends Bloc<ImagenEvent, ImagenState> {
  ImagenBloc() : super(ImagenInitial()) {
    on<ImagenEvent>(ImagenCambiar);
  }
  void ImagenCambiar(ImagenEvent event, Emitter emit) async{
    var img = await _pickImage();
    if (img == null){
      emit(ImagenErrorState(errorMsg: "Error"));
    } else {
      emit(ImageSelected(picture: img));
    }
  }

  Future _pickImage() async {
    try {
      final seed = DateTime.now().second;
      http.Response res = await http.get(Uri.parse("https://picsum.photos/seed/${seed}/200/300"));
      if(res.statusCode == HttpStatus.ok)
        return (res.bodyBytes);
    } catch (e) {print(e);}
  }


}
