
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable{
  final List<Category> allCategories;

 const CategoryState({this.allCategories=const[]});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}