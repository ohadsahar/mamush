import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/user/user.bloc.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/screens/HomeScreen/LocalWidgets/home_screen_profile_image.widget.dart';
import 'package:momrecipes/screens/RecipeScreen/LocalWidgets/recipe_app_bar.widget.dart';
import 'package:momrecipes/screens/UserProfile/LocalWidgets/user_profile_action_card.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/services/storage.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app.screen.dart';
import 'package:momrecipes/widgets/column_scroll_view.widget.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  late UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return AppScreen(
      child: ColumnScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: _goBack,
              child: Container(
                margin: EdgeInsets.only(
                  right: Dimensions.sxl,
                  top: Dimensions.xl,
                ),
                child: RecipeAppBarWidget(
                  goBack: _goBack,
                  recipeName: strings.userProfileScreenGoBack,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  strings.userProfileScreenProfileOf,
                  style: appTheme.textTheme.headline2,
                ),
                const SizedBox(
                  height: Dimensions.md,
                ),
                HomeScreenProfileImageWidget(
                  profileImage: _userBloc.state.user.profilePicture != null
                      ? _userBloc.state.user.profilePicture!.filePath
                      : Assets.images.noUser.path,
                ),
                const SizedBox(
                  height: Dimensions.md,
                ),
                SizedBox(
                  child: Text(
                    _userBloc.state.user.fullName.toString(),
                    style: appTheme.textTheme.headline2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                UserProfileActionCardWidget(
                  cardName: strings.userProfileCardDisconnect,
                  onPress: _disconnect,
                  icon: Icons.logout,
                ),
                UserProfileActionCardWidget(
                  cardName: strings.userProfileCardEditProfile,
                  onPress: _editProfile,
                  icon: Icons.edit,
                ),
              ],
            ),
            const SizedBox(
              height: Dimensions.md,
            ),
          ],
        ),
      ),
    );
  }

  _disconnect() {
    final NavigationService navigationService = getIt<NavigationService>();
    final StorageService storageService = getIt<StorageService>();
    storageService.setToken('');
    navigationService.navigateReplace(
      Routes.phoneScreen,
      null,
    );
  }

  _editProfile() {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.navigateReplace(
      Routes.completeProfileScreen,
      null,
    );
  }

  _goBack() {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.pop();
  }
}
