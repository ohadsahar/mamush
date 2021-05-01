import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/category/category.controller.dart';
import 'package:momrecipes/bloc/category/category.events.dart';
import 'package:momrecipes/bloc/category/category.state.dart';

class CategoryBloc extends Bloc<CategoryEvents, CategoryState> {
  final CategoryController categoryController;

  CategoryBloc({
    required this.categoryController,
  }) : super(
          CategoryInitState(),
        );

  @override
  Stream<CategoryState> mapEventToState(CategoryEvents event) async* {
    switch (event.eventType) {
      case ECategoryEvents.getCategories:
        try {
          yield CategoryLoadingState();
          final categories = await categoryController.getCategories();
          yield CategoryLoaded(
            categories: categories,
          );
          break;
        } catch (e) {}
    }
  }
}
