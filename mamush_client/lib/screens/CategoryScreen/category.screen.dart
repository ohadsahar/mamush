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
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/model/recipe/recipe_filter.dto.dart';
import 'package:momrecipes/screens/CategoryScreen/LocalWidgets/category_recipes.widget.dart';
import 'package:momrecipes/screens/CategoryScreen/LocalWidgets/category_recipes_action_buttons.widget.dart';
import 'package:momrecipes/screens/CategoryScreen/LocalWidgets/tags_grid.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
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
        print(state);

        final name = (ModalRoute.of(context)!.settings.arguments as Map)["name"]
            .toString();
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: AppColors.categoryScreenBackground,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            title: Column(
                              children: [
                                SizedBox(
                                  height: Dimensions.md,
                                ),
                                CategoryRecipesActionButtons(
                                  goBack: _goBack,
                                ),
                              ],
                            ),
                            collapsedHeight: Dimensions.getScreenFractionHeight(
                              context,
                              0.05,
                            ),
                            backgroundColor: Colors.white.withOpacity(
                              0.5,
                            ),
                            expandedHeight: Dimensions.getScreenFractionHeight(
                              context,
                              0.32,
                            ),
                            floating: false,
                            pinned: true,
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: false,
                              background: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Assets.images.categoryBackground.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: Dimensions.sxl * 1.5,
                                    ),
                                    Text(
                                      name,
                                      style: TextStyle(
                                        color: Color(0xff000924),
                                        fontSize:
                                            Dimensions.getScreenFractionWidth(
                                          context,
                                          0.08,
                                        ),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.sxl,
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: FormBuilder(
                                        key: _formKey,
                                        onChanged: () => {_filterByName()},
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        child: CustomInputWidget(
                                          onChange: (value) => {},
                                          prefixIcon: Container(
                                            margin: EdgeInsets.only(
                                              left: Dimensions.md,
                                            ),
                                            child: Icon(
                                              Icons.search,
                                              color: Colors.white,
                                              size: Dimensions.sxl * 1.75,
                                            ),
                                          ),
                                          autoFocus: false,
                                          validators:
                                              FormBuilderValidators.compose(
                                            [],
                                          ),
                                          attribute: 'name',
                                          hint: strings
                                              .categoryRecipeScreenSearchText,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ];
                      },
                      body: Container(
                        color: AppColors.categoryScreenBackground,
                        padding: EdgeInsets.all(
                          Dimensions.sm,
                        ),
                        child: state is RecipeLoadedState ||
                                state is RecipeCurrentLoadedState
                            ? CategoryRecipesWidget(
                                onPress: _enterRecipe,
                                recipes: state.recipes,
                              )
                            : LoadingWidget(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: Container(
              height: MediaQuery.of(context).size.width * 0.13,
              width: MediaQuery.of(context).size.width * 0.13,
              child: FloatingActionButton(
                elevation: 5,
                onPressed: _navigateToCreateRecipe,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: new LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(0xff00B460),
                        const Color(0xff00D38C),
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.width * 0.13,
                  width: MediaQuery.of(context).size.width * 0.13,
                  child: Icon(
                    Icons.add,
                    size: Dimensions.sxl * 2,
                    color: Colors.white,
                  ),
                ),
              ),
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
    final id = int.parse(
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString());
    if (isValid) {
      _recipeBloc = BlocProvider.of<RecipeBloc>(context);
      if (name == '') {
        _recipeBloc.add(
          RecipeEvents.getRecipes(id.toString()),
        );
      } else {
        final RecipeFilterDTO recipeFilterDTO = new RecipeFilterDTO(
          name: name,
          categoryID: id,
        );
        _recipeBloc.add(
          RecipeEvents.filterRecipes(recipeFilterDTO),
        );
      }
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
    final name =
        (ModalRoute.of(context)!.settings.arguments as Map)["name"].toString();
    final id =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
    _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(
      RecipeEvents.getCurrentRecipe(
        recipe.id.toString(),
        _recipeBloc.state.recipes,
      ),
    );
    navigationService
        .navigate(Routes.recipeScreen, {'id': id, 'categoryName': name});
  }

  _goBack() {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.navigateReplace(Routes.homeScreen, null);
  }

  _navigateToCreateRecipe() {
    _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    final recipe = new Recipe(
      id: 0,
      instructions: [],
      recipeIngredients: [],
      recipeName: '',
    );
    _recipeBloc.add(RecipeEvents.setCurrentRecipe(
      recipe,
      _recipeBloc.state.recipes,
    ));
    final name =
        (ModalRoute.of(context)!.settings.arguments as Map)["name"].toString();
    final id =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService
        .navigate(Routes.createRecipe, {'id': id, 'categoryName': name});
  }
}
