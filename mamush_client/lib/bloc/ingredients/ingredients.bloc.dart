import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.controller.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.events.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.state.dart';

class IngrediantBloc extends Bloc<IngrediantEvents, IngredientsState> {
  final IngrediantController ingrediantController;

  IngrediantBloc({
    required this.ingrediantController,
  }) : super(
          IngredientInitState(),
        );

  @override
  Stream<IngredientsState> mapEventToState(IngrediantEvents event) async* {
    switch (event.eventType) {
      case EIngredientEvents.getIngredients:
        try {
          yield IngredientLoadingState();
          final ingrediants =
              await ingrediantController.getIngrediants(event.name);
          yield IngredientLoadedState(
            ingredients: ingrediants ?? [],
          );
          break;
        } catch (e) {
          throw new Error();
        }

      case EIngredientEvents.createIngredient:
        yield IngredientLoadingState();
        final createdIngredient =
            await ingrediantController.createIngredient(event.name);
        yield IngrediendAddedSucessfullyState(
          createdIngredient: createdIngredient,
        );
        break;
      case EIngredientEvents.resetIngredientsSearch:
        yield IngredientLoadedState(
          ingredients: [],
        );
        yield IngredientInitState();
        break;
    }
  }
}
