import 'dart:convert';
import 'dart:io';

import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:practica1/Blocs/bloc/frase_bloc.dart';
import 'package:practica1/Blocs/bloc/hora_bloc.dart';
import 'package:practica1/Blocs/bloc/imagen_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String andorra = "https://flagcdn.com/16x12/ad.png";
  String mexico = "https://flagcdn.com/16x12/mx.png";
  String peru = "https://flagcdn.com/16x12/pe.png";
  String canada = "https://flagcdn.com/16x12/ca.png";
  String argentina = "https://flagcdn.com/16x12/ar.png";
  String ukrania = "https://flagcdn.com/16x12/ua.png";



  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text('Material App Bar'),
          actions: <Widget>[
          BackdropToggleButton(
          icon: AnimatedIcons.list_view,
      )
    ]
        ),
        frontLayer: Stack(
          children: <Widget>[
            BlocConsumer<ImagenBloc,ImagenState>(
              listener: (context, state){},
              builder: (context, state){
                if(state is ImageSelected){
                  return Container(
                    child: 
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.45), BlendMode.srcOver),
                      child: Image.memory(
                        state.picture,
                        height: MediaQuery.of(context).size.height - 106,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        ),
                    ),
                    );
                }
                else{
                  return Text("Cargando...");
                }
              }),
              BlocConsumer<FraseBloc,FraseState>(
              listener: (context, state1){},
              builder: (context, state1){
                if(state1 is FraseSelected){
                  return Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state1.frasemap,
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Colors.white
                            )),
                          Text(
                            state1.autormap,
                            style: TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left
                            )
                        ],
                      ),
                    ),
                    );
                }
                else{
                  return Text("Cargando...");
                }
              }),

              BlocConsumer<HoraBloc, HoraState>(
                listener: (context, state){},
                builder: (context, state){
                  if(state is HoraSelected){
                    return Container(
                      alignment: Alignment.topCenter,
                      child:
                        Column(
                          children: [
                          SizedBox(height: 45),
                          Text(
                              state.tiempo.substring(11, 19),
                              style: TextStyle(
                                  fontSize: 50,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white
                                )
                          ),
                          Text(
                            state.pais,
                            style: TextStyle(
                                  fontSize: 30,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white
                                )
                          ),
                          ],
                        )
                    );
                  }
                  else{
                    return Text("Cargando...");
                  }
                }, 
                )
          ]
        ),
        backLayer: BackdropNavigationBackLayer(
        items: [
          ListTile(
            leading: Image.network(mexico),
            title: Text("Mexico"),
            onTap: (){
              BlocProvider.of<HoraBloc>(context).add(HoraCambiar(pais: 1));
              BlocProvider.of<ImagenBloc>(context).add(ImagenCambiar());
              BlocProvider.of<FraseBloc>(context).add(FraseCambiar());
            },),
          ListTile(
            leading: Image.network(peru),
            title: Text("Peru"),
            onTap: (){
              BlocProvider.of<HoraBloc>(context).add(HoraCambiar(pais: 3));
              BlocProvider.of<ImagenBloc>(context).add(ImagenCambiar());
              BlocProvider.of<FraseBloc>(context).add(FraseCambiar());
            }),
          ListTile(
            leading: Image.network(andorra),
            title: Text("Andorra"),
            onTap: (){
              BlocProvider.of<HoraBloc>(context).add(HoraCambiar(pais: 0));
              BlocProvider.of<ImagenBloc>(context).add(ImagenCambiar());
              BlocProvider.of<FraseBloc>(context).add(FraseCambiar());
            }),
          ListTile(
            leading: Image.network(canada),
            title: Text("Canada"),
            onTap: (){
              BlocProvider.of<HoraBloc>(context).add(HoraCambiar(pais: 4));
              BlocProvider.of<ImagenBloc>(context).add(ImagenCambiar());
              BlocProvider.of<FraseBloc>(context).add(FraseCambiar());
            }),
          ListTile(
            leading: Image.network(argentina),
            title: Text("Argentina"),
            onTap: (){
              BlocProvider.of<HoraBloc>(context).add(HoraCambiar(pais: 5));
              BlocProvider.of<ImagenBloc>(context).add(ImagenCambiar());
              BlocProvider.of<FraseBloc>(context).add(FraseCambiar());
            }),
          ListTile(
            leading: Image.network(ukrania),
            title: Text("Ukrania"),
            onTap: (){
              BlocProvider.of<HoraBloc>(context).add(HoraCambiar(pais: 6));
              BlocProvider.of<ImagenBloc>(context).add(ImagenCambiar());
              BlocProvider.of<FraseBloc>(context).add(FraseCambiar());
            })
        ]
      )
    );
  }
}

