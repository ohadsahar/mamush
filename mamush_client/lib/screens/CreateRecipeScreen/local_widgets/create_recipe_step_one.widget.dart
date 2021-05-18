import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/screens/CompleteProfileScreen/LocalWidgets/bottom_sheet_handler.widget.dart';
import 'package:momrecipes/screens/CompleteProfileScreen/LocalWidgets/complete_profile_camera.widget.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';

class CreateRecipeStepOneWidget extends StatefulWidget {
  final Function imageSelected;
  final formKey;
  const CreateRecipeStepOneWidget({
    required this.formKey,
    required this.imageSelected,
  });
  @override
  _CreateRecipeStepOneWidgetState createState() =>
      _CreateRecipeStepOneWidgetState();
}

class _CreateRecipeStepOneWidgetState extends State<CreateRecipeStepOneWidget> {
  late File _image = File('');
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Center(
      child: FormBuilder(
        key: widget.formKey,
        child: Column(
          children: [
            const SizedBox(
              height: Dimensions.sxl * 3,
            ),
            CompleteProfileCameraWidget(
              image: _image,
              filePath: '',
              modalBottomSheetMenu: _modalBottomSheetMenu,
            ),
            const SizedBox(
              height: Dimensions.sxl * 1.5,
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: CustomInputWidget(
                onChange: (value) => {},
                initialValue: '',
                validators: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.minLength(
                      context,
                      1,
                      errorText: strings.completeProfileScreenError,
                    ),
                  ],
                ),
                hint: strings.createRecipeAddRecipeName,
                attribute: 'recipeName',
                type: TextInputType.text,
                // change: false,
                // onChange: _onChanged,
              ),
            ),
            SizedBox(
              height: Dimensions.getScreenFractionHeight(
                context,
                0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onChanged(String value) {
    print(value);
  }

  void _modalBottomSheetMenu() {
    final S strings = S.of(context);
    final String imageType = 'image';
    final String galleryType = 'gallery';
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          height: 125.0,
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: new Center(
              child: Column(
                children: <Widget>[
                  BottomSheetHandlerWidget(
                    getImage: getImage,
                    placeholder: strings.completeProfileScreenCamera,
                    type: imageType,
                  ),
                  const SizedBox(height: Dimensions.md),
                  BottomSheetHandlerWidget(
                    getImage: getImage,
                    placeholder: strings.completeProfileScreenGallery,
                    type: galleryType,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future getImage(String type) async {
    final pickedFile = await picker.getImage(
      source: type == 'gallery' ? ImageSource.gallery : ImageSource.camera,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(
          pickedFile.path,
        );
      }
    });
    widget.imageSelected(_image);
  }
}
