import 'package:flutter/material.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/screens/HomeScreen/LocalWidgets/home_action_button.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/utils/dimensions.dart';

class HomeActionButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        HomeActionButton(
          iconName: Icons.person,
          onPress: _navigateToUserProfile,
        ),
        // Container(
        //   margin: EdgeInsets.only(
        //     right: Dimensions.xl,
        //   ),
        //   child: HomeActionButton(
        //     iconName: Icons.format_list_bulleted_rounded,
        //   ),
        // ),
      ],
    );
  }

  _navigateToUserProfile() {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.navigate(
      Routes.userProfileScreen,
      null,
    );
  }
}
