part of 'frase_bloc.dart';

@immutable
abstract class FraseEvent extends Equatable{
  const FraseEvent();

  @override
  List<Object> get props => [];
}

class FraseCambiar extends FraseEvent {}
