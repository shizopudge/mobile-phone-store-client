import 'package:equatable/equatable.dart';

class PickedColor extends Equatable {
  final String name;
  final String code;

  const PickedColor({
    required this.name,
    required this.code,
  });

  @override
  List<Object?> get props => [name, code];
}
