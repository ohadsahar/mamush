import 'package:equatable/equatable.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';

abstract class TagsState extends Equatable {
  @override
  List<Object> get props => [];
  List<Tags> get tags => this.tags;
}

class TagsInitState extends TagsState {}

class TagsLoadingState extends TagsState {}

class TagsLoadedState extends TagsState {
  final List<Tags> tags;
  TagsLoadedState({
    required this.tags,
  });
}
