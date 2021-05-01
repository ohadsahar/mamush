import 'package:flutter/material.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/screens/RecipeScreen/LocalWidgets/recipe_instructions_item.widget.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class RecipeInstructionsWidget extends StatefulWidget {
  final Recipe recipe;

  const RecipeInstructionsWidget({
    required this.recipe,
  });

  @override
  _RecipeInstructionsWidgetState createState() =>
      _RecipeInstructionsWidgetState();
}

class _RecipeInstructionsWidgetState extends State<RecipeInstructionsWidget> {
  final double width = 0.9;
  final double elevation = 10;
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Center(
      child: SizedBox(
        width: Dimensions.getScreenFractionWidth(
          context,
          width,
        ),
        child: Card(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white70,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.sm,
            ),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(
              Dimensions.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  strings.recipeScreenInstruction,
                  style: appTheme.textTheme.headline3,
                ),
                for (int index = 0;
                    index < widget.recipe.instructions.length;
                    index++)
                  Container(
                    padding: EdgeInsets.all(
                      Dimensions.sm,
                    ),
                    child: RecipeInstructionsItemWidget(
                      index: index,
                      instructionsDescription: widget
                          .recipe.instructions[index].instructionsDescription,
                      hasTimer: widget.recipe.instructions[index].hasTimer,
                      timer: widget.recipe.instructions[index].timer.toString(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
