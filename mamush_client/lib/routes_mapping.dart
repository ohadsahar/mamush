import 'package:flutter/material.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/screens/CategoryScreen/category.screen.dart';
import 'package:momrecipes/screens/CompleteProfileScreen/complete_profile.screen.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/create_recipe.screen.dart';
import 'package:momrecipes/screens/PhoneInput/phone_input.screen.dart';
import 'package:momrecipes/screens/HomeScreen/home.screen.dart';
import 'package:momrecipes/screens/RecipeScreen/recipe.screen.dart';
import 'package:momrecipes/screens/SplashScreen/splash.screen.dart';
import 'package:momrecipes/screens/UserProfile/user_profile.screen.dart';

final routesMapping = <String, WidgetBuilder>{
  Routes.splashScreen: (context) => AppSplashScreen(),
  Routes.homeScreen: (context) => HomeScreen(),
  Routes.phoneScreen: (context) => PhoneInputScreen(),
  Routes.completeProfileScreen: (context) => CompleteProfileScreen(),
  Routes.categoryScreen: (context) => CategoryScreen(),
  Routes.recipeScreen: (context) => RecipeScreen(),
  Routes.userProfileScreen: (context) => UserProfileScreen(),
  Routes.createRecipe: (context) => CreateRecipeScreen(),
};
