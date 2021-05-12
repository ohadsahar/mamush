import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/local_widgets/create_recipe_step_one.widget.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/local_widgets/create_recipe_step_two.widget.dart';
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
  var counter = 0;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final categoryName =
        (ModalRoute.of(context)!.settings.arguments as Map)["categoryName"]
            .toString();
    final id =
        (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
    final S strings = S.of(context);
    return AppScreen(
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
                    onSubmit: _onSubmitFirstStep,
                    formKey: _formKey,
                  )
                : CreateRecipeStepTWoWidget(
                    onSubmit: _onSubmitSecondStep,
                  )
          ],
        ),
      ),
    );
  }

  _onSubmitFirstStep(image) {
    final isValid = _formKey.currentState!.saveAndValidate();
    print(_formKey.currentState!.value);
    print(image);
    setState(() {
      counter += 1;
    });
  }

  _onSubmitSecondStep(String value) {
    final isValid = _formKey.currentState!.saveAndValidate();
    print(_formKey.currentState!.value);
  }

  _addInd() {}

  _goBack() {
    setState(() {
      counter -= 1;
    });
  }

  // void _modalBottomSheetMenu() {
  //   final S strings = S.of(context);
  //   final String imageType = 'image';
  //   final String galleryType = 'gallery';
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (builder) {
  //       return new Container(
  //         height: 125.0,
  //         color: Colors.transparent,
  //         child: new Container(
  //           decoration: new BoxDecoration(
  //             color: Colors.white,
  //           ),
  //           child: new Center(
  //             child: Column(
  //               children: <Widget>[
  //                 BottomSheetHandlerWidget(
  //                   getImage: getImage,
  //                   placeholder: strings.completeProfileScreenCamera,
  //                   type: imageType,
  //                 ),
  //                 const SizedBox(height: Dimensions.md),
  //                 BottomSheetHandlerWidget(
  //                   getImage: getImage,
  //                   placeholder: strings.completeProfileScreenGallery,
  //                   type: galleryType,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future getImage(String type) async {
  //   final pickedFile = await picker.getImage(
  //     source: type == 'gallery' ? ImageSource.gallery : ImageSource.camera,
  //   );

  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(
  //         pickedFile.path,
  //       );
  //     }
  //   });
  // }
}
