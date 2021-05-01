import 'package:flutter/material.dart';
import 'package:momrecipes/utils/dimensions.dart';

class HomeScreenProfileImageWidget extends StatelessWidget {
  final String profileImage;
  const HomeScreenProfileImageWidget({
    required this.profileImage,
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(
          300,
        ),
      ),
      child: ClipOval(
        child: Uri.parse(profileImage).isAbsolute
            ? Image.network(
                profileImage,
                width: width,
                height: height,
                fit: BoxFit.cover,
              )
            : Image.asset(
                profileImage,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
