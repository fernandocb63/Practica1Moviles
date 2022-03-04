import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/Blocs/bloc/frase_bloc.dart';
import 'package:practica1/Blocs/bloc/hora_bloc.dart';
import 'package:practica1/Blocs/bloc/imagen_bloc.dart';
import 'package:practica1/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      title: 'Material App',
      home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ImagenBloc()..add(ImagenCambiar()),
              ),
              BlocProvider(
                create: (context) => FraseBloc()..add(FraseCambiar()),
              ),
              BlocProvider(
                create: (context) => HoraBloc()..add(HoraCambiar(pais: 1))),
            ],
            child: HomePage()
          ),
        );
  }
}