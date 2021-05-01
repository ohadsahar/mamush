import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:momrecipes/bloc/recipe/recipe.bloc.dart';
import 'package:momrecipes/bloc/recipe/recipe.events.dart';
import 'package:momrecipes/bloc/recipe/recipe.state.dart';
import 'package:momrecipes/bloc/tag/tag.bloc.dart';
import 'package:momrecipes/bloc/tag/tag.events.dart';
import 'package:momrecipes/bloc/tag/tag.state.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/model/recipe/recipe_filter.dto.dart';
import 'package:momrecipes/screens/CategoryScreen/LocalWidgets/category_recipes.widget.dart';
import 'package:momrecipes/screens/CategoryScreen/LocalWidgets/category_recipes_action_buttons.widget.dart';
import 'package:momrecipes/screens/CategoryScreen/LocalWidgets/tags_grid.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app.screen.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';
import 'package:momrecipes/widgets/loading.widget.dart';

class CategoryScreen extends StatefulWidget {
  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late RecipeBloc _recipeBloc;
  late TagsBloc _tagsBloc;
  final List<String> selectedTags = [];
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (BuildContext context, RecipeState state) {
        final name = (ModalRoute.of(context)!.settings.arguments as Map)["name"]
            .toString();
        return AppScreen(
          child: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: Dimensions.xxl,
                ),
                CategoryRecipesActionButtons(
                  goBack: _goBack,
                  categoryName: name,
                ),
                const SizedBox(
                  height: Dimensions.xxl,
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: FormBuilder(
                    key: _formKey,
                    onChanged: () => {_filterByName()},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CustomInputWidget(
                      autoFocus: false,
                      validators: FormBuilderValidators.compose(
                        [],
                      ),
                      attribute: 'name',
                      hint: strings.categoryRecipeScreenSearchText,
                      type: TextInputType.text,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.xxl,
                ),
                BlocBuilder<TagsBloc, TagsState>(
                  builder: (
                    BuildContext context,
                    TagsState state,
                  ) {
                    if (state is TagsLoadedState) {
                      return SizedBox(
                        height: 100,
                        child: TagsGridWidget(
                          tags: state.tags,
                          onPress: _tagIncluded,
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 30),
                state is RecipeLoadedState || state is RecipeCurrentLoadedState
                    ? CategoryRecipesWidget(
                        onPress: _enterRecipe,
                        recipes: state.recipes,
                      )
                    : LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final id =
          (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
      _getRecipes(id);
      _getTags(id);
    });
  }

  _getRecipes(String id) {
    _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(
      RecipeEvents.getRecipes(id),
    );
  }

  _getTags(String id) {
    _tagsBloc = BlocProvider.of<TagsBloc>(context);
    _tagsBloc.add(
      TagsEvents.getTags(id),
    );
  }

  _filterByName() {
    Debounce.seconds(
      1,
      _goSearch,
    );
  }

  _goSearch() {
    final isValid = _formKey.currentState!.saveAndValidate();
    final String name = _formKey.currentState!.value['name'];
    if (isValid) {
      _recipeBloc = BlocProvider.of<RecipeBloc>(context);
      final RecipeFilterDTO recipeFilterDTO = new RecipeFilterDTO(
        name: name,
      );
      _recipeBloc.add(
        RecipeEvents.filterRecipes(recipeFilterDTO),
      );
    }
  }

  _tagIncluded(int id) {
    final int index = selectedTags.indexWhere((tag) => tag == id.toString());
    if (index >= 0) {
      selectedTags.removeAt(index);
    } else {
      selectedTags.add(
        id.toString(),
      );
    }
    _filterByAll();
  }

  _filterByAll() {
    final id =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
    final RecipeFilterDTO recipeFilterDTO = new RecipeFilterDTO(
      categoryID: int.parse(id),
      tags: selectedTags,
      name: _formKey.currentState!.value['name'],
    );
    _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(
      RecipeEvents.filterRecipes(recipeFilterDTO),
    );
  }

  _enterRecipe(Recipe recipe) {
    final NavigationService navigationService = getIt<NavigationService>();

    _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(
      RecipeEvents.setCurrentRecipe(
        recipe,
        _recipeBloc.state.recipes,
      ),
    );
    navigationService.navigate(Routes.recipeScreen, null);
  }

  _goBack() {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.pop();
  }
}
