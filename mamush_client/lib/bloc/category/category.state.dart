import 'package:equatable/equatable.dart';
import 'package:momrecipes/model/category/category.response.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
  List<Category> get categories => this.categories;
}

class CategoryInitState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({
    required this.categories,
  });
}
