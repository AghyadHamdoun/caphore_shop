import 'package:equatable/equatable.dart';

class Term extends Equatable{
  final int id;
  final String name;
  final String description;

  const Term({required this.name,required this.id,required this.description});

  @override
  List<Object?> get props => [id,name,description];
}