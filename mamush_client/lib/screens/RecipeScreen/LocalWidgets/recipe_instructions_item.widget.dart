import 'package:flutter/material.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class RecipeInstructionsItemWidget extends StatelessWidget {
  final int index;
  final String instructionsDescription;
  final bool hasTimer;
  final String timer;
  const RecipeInstructionsItemWidget({
    required this.index,
    required this.instructionsDescription,
    required this.hasTimer,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    final double maxWidth = 0.65;
    final double maxWidthTimer = 0.3;
    final S strings = S.of(context);
    return Card(
      color: AppColors.categoryScreenBackground,
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.sm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.recipeScreenInstructionNumber(
                ((index + 1).toString()),
              ),
              style: appTheme.textTheme.headline3,
            ),
            Container(
              margin: EdgeInsets.only(
                right: Dimensions.xl,
              ),
              width: Dimensions.getScreenFractionWidth(
                context,
                maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    instructionsDescription,
                    style: appTheme.textTheme.headline3,
                  ),
                  const SizedBox(
                    height: Dimensions.sm,
                  ),
                  hasTimer
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: Dimensions.sxl,
                            ),
                            Container(
                              width: Dimensions.getScreenFractionWidth(
                                context,
                                maxWidthTimer,
                              ),
                              margin: EdgeInsets.only(
                                right: Dimensions.md,
                              ),
                              child: Text(
                                strings.recipeInstructionTimer(timer),
                                style: appTheme.textTheme.headline3,
                              ),
                            )
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
