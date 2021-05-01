import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class BottomSheetHandlerWidget extends StatelessWidget {
  final Function getImage;
  final String placeholder;
  final String type;
  const BottomSheetHandlerWidget({
    required this.getImage,
    required this.placeholder,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final String galleryType = 'gallery';
    return InkWell(
      onTap: () => getImage(type),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: Dimensions.sm,
            ),
            child: IconButton(
              icon: Icon(
                type == galleryType ? Icons.image : Icons.camera_alt,
                size: 32,
                color: AppColors.appPrimaryColor,
              ),
              onPressed: () => getImage(type),
            ),
          ),
          Text(
            placeholder,
            style: appTheme.textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
