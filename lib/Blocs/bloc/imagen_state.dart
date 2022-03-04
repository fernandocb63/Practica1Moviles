part of 'imagen_bloc.dart';

@immutable
abstract class ImagenState extends Equatable{
  const ImagenState();

  @override
  List<Object> get props => [];
}

class ImagenInitial extends ImagenState {}

class ImagenErrorState extends ImagenState {
  final String errorMsg;

  ImagenErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class ImageSelected extends ImagenState {
  final Uint8List picture;

  ImageSelected({required this.picture});

  @override
  List<Object> get props => [picture];
}
