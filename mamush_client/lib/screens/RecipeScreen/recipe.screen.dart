import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/recipe/recipe.bloc.dart';
import 'package:momrecipes/bloc/recipe/recipe.events.dart';
import 'package:momrecipes/bloc/recipe/recipe.state.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/screens/RecipeScreen/LocalWidgets/recipe_app_bar.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';
import 'package:momrecipes/widgets/column_scroll_view.widget.dart';
import 'package:momrecipes/widgets/loading.widget.dart';

import 'LocalWidgets/recipe_ingredients.widget.dart';
import 'LocalWidgets/recipe_instructions.widget.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final double imageHeight = 0.18;
  final double width = 0.9;
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (BuildContext context, RecipeState state) {
        if (state is RecipeCurrentLoadedState) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: ColumnScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Hero(
                          tag: state.recipe.id,
                          child: state.recipe.recipePicture != null
                              ? Container(
                                  width: double.infinity,
                                  height: Dimensions.getScreenFractionHeight(
                                    context,
                                    imageHeight,
                                  ),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: Assets.images.loading.path,
                                    image: state.recipe.recipePicture!.filePath,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  color: Colors.black,
                                  width: double.infinity,
                                  height: Dimensions.getScreenFractionHeight(
                                    context,
                                    imageHeight,
                                  ),
                                  child: Image.asset(
                                    Assets.images.emptyStateFood.path,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: Dimensions.getScreenFractionHeight(
                              context,
                              0.075,
                            ),
                            color: Colors.black.withOpacity(
                              0.6,
                            ),
                          ),
                        ),
                        Positioned(
                          top: Dimensions.xl,
                          right: Dimensions.xl,
                          child: RecipeAppBarWidget(
                            goBack: _goBack,
                            recipeName: state.recipe.recipeName,
                          ),
                        ),
                        Positioned(
                          top: Dimensions.xl,
                          left: Dimensions.xl,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: Dimensions.sxl * 1.25,
                              color: Colors.white,
                            ),
                            onPressed: _edit,
                          ),
                        ),
                        Positioned(
                          top: Dimensions.xl,
                          left: Dimensions.xl * 4,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete_forever,
                              size: Dimensions.sxl * 1.25,
                              color: Colors.white,
                            ),
                            onPressed: _delete,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.sxl,
                    ),
                    Container(
                      child: Center(
                        child: SizedBox(
                          width: Dimensions.getScreenFractionWidth(
                            context,
                            width,
                          ),
                          child: RecipeIngredientsWidget(
                            recipe: state.recipe,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.sxl,
                    ),
                    RecipeInstructionsWidget(
                      recipe: state.recipe,
                    ),
                    const SizedBox(
                      height: Dimensions.sxl,
                    ),
                    AppButton(
                      width: Dimensions.getScreenFractionWidth(
                        context,
                        0.3,
                      ),
                      height: Dimensions.getScreenFractionHeight(context, 0.07),
                      color: AppColors.appPrimaryColor,
                      onSubmit: () => _onSubmit(state.recipe),
                      text: strings.recipeScreenFinishedRecipe,
                    ),
                    const SizedBox(
                      height: Dimensions.xxl,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  void _edit() {
    final name =
        (ModalRoute.of(context)!.settings.arguments as Map)["categoryName"]
            .toString();
    final id =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.navigateReplace(Routes.createRecipe, {
      'id': id,
      'categoryName': name,
    });
  }

  void _delete() {
    final name =
        (ModalRoute.of(context)!.settings.arguments as Map)["categoryName"]
            .toString();
    final id =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();

    final _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(
      RecipeEvents.deleteRecipe(
        _recipeBloc.state.recipe.id.toString(),
        _recipeBloc.state.recipes,
        id,
        name,
      ),
    );
  }

  _onSubmit(Recipe recipe) {
    for (var i = 0; i < recipe.recipeIngredients!.length; i++) {
      recipe.recipeIngredients![i].onSelected(false);
    }
    setState(() {});
    _goBack();
  }

  _goBack() {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.pop();
  }
}
