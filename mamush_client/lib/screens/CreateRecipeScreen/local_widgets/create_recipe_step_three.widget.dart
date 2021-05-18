import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';

class CreateRecipeStepThreeWidget extends StatefulWidget {
  final Function onSubmit;
  final List<Instructions> instructionsToSave;

  CreateRecipeStepThreeWidget({
    required this.onSubmit,
    required this.instructionsToSave,
  });

  @override
  _CreateRecipeStepThreeWidgetState createState() =>
      _CreateRecipeStepThreeWidgetState();
}

class _CreateRecipeStepThreeWidgetState
    extends State<CreateRecipeStepThreeWidget> {
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Stack(
      children: [
        Container(
          height: Dimensions.getScreenFractionHeight(
            context,
            0.9,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.md,
            ),
            scrollDirection: Axis.vertical,
            itemCount: widget.instructionsToSave.length,
            itemBuilder: (BuildContext context, int index) => Container(
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.sxl,
                      ),
                      child: Column(
                        children: <Widget>[
                          FormBuilder(
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: Dimensions.getScreenFractionWidth(
                                      context,
                                      0.9,
                                    ),
                                    child: CustomInputWidget(
                                      onChange: (value) => {
                                        setState(() {
                                          widget.instructionsToSave[index]
                                              .instructionsDescription = value;
                                        })
                                      },
                                      maxLines: 3,
                                      initialValue: widget
                                          .instructionsToSave[index]
                                          .instructionsDescription,
                                      autoFocus: false,
                                      validators: FormBuilderValidators.compose(
                                        [],
                                      ),
                                      attribute: 'name',
                                      hint: strings
                                          .createRecipeStepThreeAddInstruction,
                                      type: TextInputType.text,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Dimensions.md,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Checkbox(
                                          value: widget
                                                  .instructionsToSave[index]
                                                  .timerOn ??
                                              false,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                widget.instructionsToSave[index]
                                                    .timerOn = value;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: Dimensions.sxl,
                                        ),
                                        child: Text(
                                          'צריך כאן טיימר',
                                          style: appTheme.textTheme.headline4,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            Dimensions.getScreenFractionWidth(
                                          context,
                                          0.25,
                                        ),
                                        height: 100,
                                        child: widget.instructionsToSave[index]
                                                    .timerOn ==
                                                true
                                            ? CustomInputWidget(
                                                initialValue: widget
                                                    .instructionsToSave[index]
                                                    .instructionsDescription,
                                                autoFocus: false,
                                                validators:
                                                    FormBuilderValidators
                                                        .compose(
                                                  [],
                                                ),
                                                attribute: 'name',
                                                hint: strings
                                                    .createRecipeStepThreeTimer,
                                                type: TextInputType.number,
                                              )
                                            : SizedBox(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.sxl,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: Dimensions.getScreenFractionWidth(
            context,
            0.35,
          ),
          child: AppButton(
            onSubmit: _addNewInsturaction,
            text: strings.createRecipeStepThree,
          ),
        )
      ],
    );
  }

  _addNewInsturaction() {
    final Instructions newInsturaction = new Instructions(
      id: null,
      instructionsDescription: '',
      hasTimer: false,
      timer: 0,
      timerOn: false,
    );
    widget.instructionsToSave.add(newInsturaction);
    setState(() {});
  }

  _removeInsturaction(int index) {
    widget.instructionsToSave.removeAt(index);
    setState(() {});
  }
}