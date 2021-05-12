import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/category/category.bloc.dart';
import 'package:momrecipes/bloc/category/category.events.dart';
import 'package:momrecipes/bloc/category/category.state.dart';
import 'package:momrecipes/bloc/user/user.bloc.dart';
import 'package:momrecipes/bloc/user/user.events.dart';
import 'package:momrecipes/bloc/user/user.state.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/screens/HomeScreen/LocalWidgets/home_categories.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app.screen.dart';
import 'package:momrecipes/widgets/loading.widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late UserBloc _userBloc;
  late CategoryBloc _categoryBloc;

  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (
        BuildContext context,
        UserState state,
      ) {
        return AppScreen(
          withImage: false,
          child: state is UserUpdateState
              ? Stack(
                  children: [
                    Container(
                      color: AppColors.categoryScreenBackground,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: Dimensions.getScreenFractionHeight(
                              context,
                              0.25,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.images.categoryBackground.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: _navigateToUserProfile,
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                      top: Dimensions.xl,
                                      left: Dimensions.xl,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 5,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          60,
                                        ),
                                      ),
                                      child: state.user.profilePicture != null
                                          ? ClipOval(
                                              child: Image.network(
                                                state.user.profilePicture!
                                                    .filePath,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : SizedBox(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.getScreenFractionHeight(
                              context,
                              0.12,
                            ),
                          ),
                          Text(
                            strings.homeScreenHelloAndWelcome(
                              state.user.fullName!,
                            ),
                            style: appTheme.textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: Dimensions.sxl * 2,
                          ),
                          Text(
                            strings.homeScreenMainCategories,
                            style: appTheme.textTheme.headline4,
                          ),
                          const SizedBox(
                            height: Dimensions.sxl,
                          ),
                          BlocBuilder<CategoryBloc, CategoryState>(
                            builder: (
                              BuildContext context,
                              CategoryState state,
                            ) {
                              if (state is CategoryLoaded) {
                                return HomeCategoriesWidget(
                                  categories: state.categories,
                                  onPress: _enterCategoryScreen,
                                );
                              } else {
                                return LoadingWidget();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: Dimensions.getScreenFractionHeight(
                        context,
                        0.09,
                      ),
                      left: Dimensions.getScreenFractionWidth(
                        context,
                        0.28,
                      ),
                      child: Container(
                        width: Dimensions.getScreenFractionWidth(
                          context,
                          0.45,
                        ),
                        height: 400,
                        child: Image.asset(
                          Assets.images.logoImage.path,
                        ),
                      ),
                    ),
                  ],
                )
              : LoadingWidget(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        _categoryBloc = BlocProvider.of<CategoryBloc>(context);
        _userBloc = BlocProvider.of<UserBloc>(context);
        if (_userBloc.state is UserInitState) {
          _userBloc.add(UserEvents.getMe());
        }

        if (_categoryBloc.state is CategoryInitState) {
          _categoryBloc.add(CategoryEvents.getCategories());
        }
      },
    );
  }

  _enterCategoryScreen(int id, String categoryName) {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.navigate(Routes.categoryScreen, {
      'id': id,
      'name': categoryName,
    });
  }

  _navigateToUserProfile() {
    final NavigationService navigationService = getIt<NavigationService>();
    navigationService.navigate(
      Routes.userProfileScreen,
      null,
    );
  }
}
