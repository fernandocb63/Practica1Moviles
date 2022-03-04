part of 'hora_bloc.dart';

@immutable
abstract class HoraState extends Equatable{
  const HoraState();

  @override
  List<Object> get props => [];
}

class HoraInitial extends HoraState {}

class HoraErrorState extends HoraState {
  final String errorMsg;

  HoraErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class HoraSelected extends HoraState {
  final String tiempo;
  final String pais;

  HoraSelected({required this.pais,required  this.tiempo});

  @override
  List<Object> get props => [tiempo, pais];
}
