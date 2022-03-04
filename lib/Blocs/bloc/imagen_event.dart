part of 'imagen_bloc.dart';

@immutable
abstract class ImagenEvent extends Equatable{
  const ImagenEvent();

  @override
  List<Object> get props => [];
}

class ImagenCambiar extends ImagenEvent {}
