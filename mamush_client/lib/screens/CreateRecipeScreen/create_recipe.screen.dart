import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momrecipes/bloc/recipe/recipe.bloc.dart';
import 'package:momrecipes/bloc/recipe/recipe.events.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/recipe/create_recipe.dto.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/local_widgets/create_recipe_step_one.widget.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/local_widgets/create_recipe_step_three.widget.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/local_widgets/create_recipe_step_two.widget.dart';
import 'package:momrecipes/services/storage.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app.screen.dart';
import 'package:momrecipes/widgets/column_scroll_view.widget.dart';

class CreateRecipeScreen extends StatefulWidget {
  @override
  CreateRecipeScreenState createState() => CreateRecipeScreenState();
}

class CreateRecipeScreenState extends State<CreateRecipeScreen> {
  late File _image = File('');
  late RecipeBloc _recipeBloc;
  var counter = 0;
  final picker = ImagePicker();
  List<RecipeIngredients> indgredientsToSave = [];
  List<Instructions> instructionsToSave = [];
  final _formKey = GlobalKey<FormBuilderState>();
  var data;
  @override
  Widget build(BuildContext context) {
    final categoryName =
        (ModalRoute.of(context)!.settings.arguments as Map)["categoryName"]
            .toString();
    final id =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
    final S strings = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.thirdColor,
      body: SafeArea(
        child: ColumnScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: Dimensions.sxl,
                  top: Dimensions.sxl,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: _goBack,
                    ),
                    Text(
                      strings.createRecipeAnotherRecipeInCategory(
                        categoryName,
                      ),
                      style: appTheme.textTheme.headline3,
                    ),
                  ],
                ),
              ),
              counter == 0
                  ? CreateRecipeStepOneWidget(
                      // onSubmit: _onSubmitFirstStep,
                      formKey: _formKey,
                      imageSelected: _imageSelected,
                    )
                  : counter == 1
                      ? CreateRecipeStepTWoWidget(
                          onSubmit: _onSubmitSecondStep,
                          indgredientsToSave: indgredientsToSave,
                        )
                      : CreateRecipeStepThreeWidget(
                          onSubmit: _onFinishForm,
                          instructionsToSave: instructionsToSave,
                        ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.width * 0.13,
        width: MediaQuery.of(context).size.width * 0.13,
        child: FloatingActionButton(
          // backgroundColor: AppColors.appPrimaryColor,
          elevation: 5,
          onPressed: () => {
            if (counter == 0)
              {_onSubmitFirstStep()}
            else if (counter == 1)
              {
                _onSubmitSecondStep(indgredientsToSave),
              }
            else if (counter == 2)
              {
                _onFinishForm(instructionsToSave),
              }
          },
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
              Icons.check,
              size: Dimensions.sxl * 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _onSubmitFirstStep() {
    final isValid = _formKey.currentState!.saveAndValidate();
    final recipeName = _formKey.currentState!.value['recipeName'];
    data = {'recipeName': recipeName, 'image': _image};
    if (isValid) {
      setState(() {
        counter += 1;
      });
    }
  }

  _onSubmitSecondStep(List<RecipeIngredients> indgredientsToSave) {
    data = {
      'recipeName': data['recipeName'],
      'image': data['image'],
      'recipeIngredients': indgredientsToSave
    };
    setState(() {
      counter += 1;
    });
  }

  _onFinishForm(List<Instructions> instructions) {
    final categoryID =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();

    CreateRecipeDTO createRecipeDTO = new CreateRecipeDTO(
      recipeName: data['recipeName'],
      recipePicture: data['image'].path,
      recipeIngredients: indgredientsToSave,
      instructions: instructions,
      category: categoryID,
    );
    _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(RecipeEvents.createRecipe(createRecipeDTO));
  }

  _imageSelected(image) {
    setState(() {
      _image = image;
    });
  }

  _goBack() {
    setState(() {
      counter -= 1;
    });
  }
}
