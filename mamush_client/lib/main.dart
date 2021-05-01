import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:momrecipes/bloc/auth/auth.bloc.dart';
import 'package:momrecipes/bloc/auth/auth.controller.dart';
import 'package:momrecipes/bloc/category/category.bloc.dart';
import 'package:momrecipes/bloc/category/category.controller.dart';
import 'package:momrecipes/bloc/recipe/recipe.bloc.dart';
import 'package:momrecipes/bloc/recipe/recipe.controller.dart';
import 'package:momrecipes/bloc/tag/tag.bloc.dart';
import 'package:momrecipes/bloc/tag/tag.controller.dart';
import 'package:momrecipes/bloc/user/user.bloc.dart';
import 'package:momrecipes/bloc/user/user.controller.dart';
import 'package:momrecipes/constants/enviorment.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/routes_mapping.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/theme/theme.dart';

import 'generated/l10n.dart';

Future<void> main(dynamic enviorment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(
    environment: enviorment is String ? enviorment : Environments.prod,
  );
  runZonedGuarded(
      () async => runApp(MyApp()), (Object error, StackTrace stack) {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
            authController: AuthController(),
          ),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(
            userController: UserController(),
          ),
        ),
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) => CategoryBloc(
            categoryController: CategoryController(),
          ),
        ),
        BlocProvider<RecipeBloc>(
          create: (BuildContext context) => RecipeBloc(
            recipeController: RecipeController(),
          ),
        ),
        BlocProvider<TagsBloc>(
          create: (BuildContext context) => TagsBloc(
            tagsController: TagsController(),
          ),
        ),
      ],
      child: MaterialApp(
        routes: routesMapping,
        initialRoute: Routes.splashScreen,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('he', 'IL'),
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
