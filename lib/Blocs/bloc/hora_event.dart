part of 'hora_bloc.dart';

@immutable
abstract class HoraEvent extends Equatable{
  const HoraEvent();

  @override
  List<Object> get props => [];
}

class HoraCambiar extends HoraEvent {
  final int pais;

  HoraCambiar({required this.pais});
  @override
  List<Object> get props => [pais];
}
