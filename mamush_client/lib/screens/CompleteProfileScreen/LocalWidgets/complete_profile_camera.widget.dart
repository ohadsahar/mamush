import 'dart:io';

import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class CompleteProfileCameraWidget extends StatelessWidget {
  final File image;
  final VoidCallback modalBottomSheetMenu;
  final String filePath;
  const CompleteProfileCameraWidget({
    required this.image,
    required this.modalBottomSheetMenu,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    final double width = Dimensions.getScreenFractionWidth(
      context,
      0.3,
    );
    final double height = Dimensions.getScreenFractionWidth(
      context,
      0.3,
    );
    final S strings = S.of(context);
    return InkWell(
      onTap: modalBottomSheetMenu,
      child: Stack(
        children: <Widget>[
          ClipOval(
            child: Uri.parse(filePath).isAbsolute
                ? Image.network(
                    filePath,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  )
                : image.path == strings.emptyString
                    ? Image.asset(
                        Assets.images.noUser.path,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        image,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      ),
          ),
          new Positioned(
            bottom: 0,
            left: Dimensions.getScreenFractionWidth(
              context,
              0.01,
            ),
            child: MaterialButton(
              padding: EdgeInsets.all(
                Dimensions.sm,
              ),
              shape: CircleBorder(),
              onPressed: modalBottomSheetMenu,
              color: AppColors.appPrimaryColor,
              textColor: Colors.white,
              child: Icon(
                Icons.camera_alt,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
