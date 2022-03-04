part of 'frase_bloc.dart';

@immutable
abstract class FraseState extends Equatable{
  const FraseState();

  @override
  List<Object> get props => [];
}

class FraseInitial extends FraseState {}

class FraseErrorState extends FraseState {
  final String errorMsg;

  FraseErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class FraseSelected extends FraseState {
  final String frasemap;
  final String autormap;

  FraseSelected({required this.autormap,required this.frasemap});

  @override
  List<Object> get props => [frasemap,autormap];
}