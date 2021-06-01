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
    return InkWell(
      onTap: modalBottomSheetMenu,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(
                300,
              ),
            ),
            child: ClipOval(
              child: image.path == "" && !Uri.parse(filePath).isAbsolute
                  ? Image.asset(
                      Assets.images.noUser.path,
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    )
                  : !Uri.parse(image.path).isAbsolute &&
                          !Uri.parse(filePath).isAbsolute
                      ? Image.file(
                          image,
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        )
                      : image.path != ""
                          ? Image.file(
                              image,
                              width: width,
                              height: height,
                              fit: BoxFit.cover,
                            )
                          : Uri.parse(filePath).isAbsolute
                              ? FadeInImage.assetNetwork(
                                  placeholder: Assets.images.loading.path,
                                  image: filePath,
                                  width: width,
                                  height: height,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  Assets.images.noUser.path,
                                  width: width,
                                  height: height,
                                  fit: BoxFit.cover,
                                ),
            ),
          ),
          new Positioned(
            bottom: 0,
            left: Dimensions.getScreenFractionWidth(
              context,
              0.01,
            ),
            child: InkWell(
              onTap: modalBottomSheetMenu,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff0DC93133),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: Offset(
                        0,
                        7,
                      ), // Shadow position
                    ),
                  ],
                  gradient: new LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xff00B460),
                      const Color(0xff00D38C),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimensions.xl,
                  ),
                ),
                padding: EdgeInsets.all(
                  Dimensions.sm,
                ),
                child: Container(
                  child: Icon(
                    Icons.camera_alt,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
