// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `המתכונים של ממושית`
  String get appName {
    return Intl.message(
      'המתכונים של ממושית',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Mamush`
  String get splashScreenTitle {
    return Intl.message(
      'Mamush',
      name: 'splashScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `היי ברוכים הבאים לMamush \n הזינו את מספר הטלפון כדי להתחבר`
  String get splashScreenDescription {
    return Intl.message(
      'היי ברוכים הבאים לMamush \n הזינו את מספר הטלפון כדי להתחבר',
      name: 'splashScreenDescription',
      desc: '',
      args: [],
    );
  }

  /// `אישור`
  String get acceptButton {
    return Intl.message(
      'אישור',
      name: 'acceptButton',
      desc: '',
      args: [],
    );
  }

  /// `הזנ/י מספר טלפון`
  String get phoneInputScreenInsertPhone {
    return Intl.message(
      'הזנ/י מספר טלפון',
      name: 'phoneInputScreenInsertPhone',
      desc: '',
      args: [],
    );
  }

  /// `שדה זה אינו בפורמט התקין`
  String get phoneInputScreenError {
    return Intl.message(
      'שדה זה אינו בפורמט התקין',
      name: 'phoneInputScreenError',
      desc: '',
      args: [],
    );
  }

  /// `גלרייה`
  String get completeProfileScreenGallery {
    return Intl.message(
      'גלרייה',
      name: 'completeProfileScreenGallery',
      desc: '',
      args: [],
    );
  }

  /// `מצלמה`
  String get completeProfileScreenCamera {
    return Intl.message(
      'מצלמה',
      name: 'completeProfileScreenCamera',
      desc: '',
      args: [],
    );
  }

  /// `מי הממוש שמבשל/ת פה?`
  String get completeProfileScreenWhoCooking {
    return Intl.message(
      'מי הממוש שמבשל/ת פה?',
      name: 'completeProfileScreenWhoCooking',
      desc: '',
      args: [],
    );
  }

  /// `שם מלא`
  String get completeProfileScreenFullName {
    return Intl.message(
      'שם מלא',
      name: 'completeProfileScreenFullName',
      desc: '',
      args: [],
    );
  }

  /// `חובה לפחות תו אחד`
  String get completeProfileScreenError {
    return Intl.message(
      'חובה לפחות תו אחד',
      name: 'completeProfileScreenError',
      desc: '',
      args: [],
    );
  }

  /// `היי {fullName},\n מה בתפריט של היום ?`
  String homeScreenHelloAndWelcome(Object fullName) {
    return Intl.message(
      'היי $fullName,\n מה בתפריט של היום ?',
      name: 'homeScreenHelloAndWelcome',
      desc: '',
      args: [fullName],
    );
  }

  /// `קטגוריות ראשיות`
  String get homeScreenMainCategories {
    return Intl.message(
      'קטגוריות ראשיות',
      name: 'homeScreenMainCategories',
      desc: '',
      args: [],
    );
  }

  /// `ניתן לחפש לפי שם המתכון`
  String get categoryRecipeScreenSearchText {
    return Intl.message(
      'ניתן לחפש לפי שם המתכון',
      name: 'categoryRecipeScreenSearchText',
      desc: '',
      args: [],
    );
  }

  /// `אין מתכונים בקטגוריה זו`
  String get categoryNoRecipes {
    return Intl.message(
      'אין מתכונים בקטגוריה זו',
      name: 'categoryNoRecipes',
      desc: '',
      args: [],
    );
  }

  /// `הרכיבים שצריך: ({ingredientsLength})`
  String recipeScreen(Object ingredientsLength) {
    return Intl.message(
      'הרכיבים שצריך: ($ingredientsLength)',
      name: 'recipeScreen',
      desc: '',
      args: [ingredientsLength],
    );
  }

  /// `סיימתי`
  String get recipeScreenFinishedRecipe {
    return Intl.message(
      'סיימתי',
      name: 'recipeScreenFinishedRecipe',
      desc: '',
      args: [],
    );
  }

  /// `עריכה`
  String get recipeScreenEditRecipe {
    return Intl.message(
      'עריכה',
      name: 'recipeScreenEditRecipe',
      desc: '',
      args: [],
    );
  }

  /// `{ingredientsAmount} {unit}`
  String recipeAmount(Object ingredientsAmount, Object unit) {
    return Intl.message(
      '$ingredientsAmount $unit',
      name: 'recipeAmount',
      desc: '',
      args: [ingredientsAmount, unit],
    );
  }

  /// `הוראות הכנה`
  String get recipeScreenInstruction {
    return Intl.message(
      'הוראות הכנה',
      name: 'recipeScreenInstruction',
      desc: '',
      args: [],
    );
  }

  /// `#{number}`
  String recipeScreenInstructionNumber(Object number) {
    return Intl.message(
      '#$number',
      name: 'recipeScreenInstructionNumber',
      desc: '',
      args: [number],
    );
  }

  /// `טיימר: {time} דקות`
  String recipeInstructionTimer(Object time) {
    return Intl.message(
      'טיימר: $time דקות',
      name: 'recipeInstructionTimer',
      desc: '',
      args: [time],
    );
  }

  /// `למסך הבית`
  String get userProfileScreenGoBack {
    return Intl.message(
      'למסך הבית',
      name: 'userProfileScreenGoBack',
      desc: '',
      args: [],
    );
  }

  /// `הפרופיל של`
  String get userProfileScreenProfileOf {
    return Intl.message(
      'הפרופיל של',
      name: 'userProfileScreenProfileOf',
      desc: '',
      args: [],
    );
  }

  /// `התנתק`
  String get userProfileCardDisconnect {
    return Intl.message(
      'התנתק',
      name: 'userProfileCardDisconnect',
      desc: '',
      args: [],
    );
  }

  /// `עריכת פרופיל`
  String get userProfileCardEditProfile {
    return Intl.message(
      'עריכת פרופיל',
      name: 'userProfileCardEditProfile',
      desc: '',
      args: [],
    );
  }

  /// `שם המתכון`
  String get createRecipeAddRecipeName {
    return Intl.message(
      'שם המתכון',
      name: 'createRecipeAddRecipeName',
      desc: '',
      args: [],
    );
  }

  /// `השלב הבא`
  String get createRecipeNextLevel {
    return Intl.message(
      'השלב הבא',
      name: 'createRecipeNextLevel',
      desc: '',
      args: [],
    );
  }

  /// `היי {name} לא נמצא במאגר שלנו, תרצו להוסיף?`
  String createRecipeItemNotExists(Object name) {
    return Intl.message(
      'היי $name לא נמצא במאגר שלנו, תרצו להוסיף?',
      name: 'createRecipeItemNotExists',
      desc: '',
      args: [name],
    );
  }

  /// `יצירת מתכון נוסף בקטגורית {categoryName}`
  String createRecipeAnotherRecipeInCategory(Object categoryName) {
    return Intl.message(
      'יצירת מתכון נוסף בקטגורית $categoryName',
      name: 'createRecipeAnotherRecipeInCategory',
      desc: '',
      args: [categoryName],
    );
  }

  /// `הקלד מספר`
  String get createRecipeStepTwoAmountInput {
    return Intl.message(
      'הקלד מספר',
      name: 'createRecipeStepTwoAmountInput',
      desc: '',
      args: [],
    );
  }

  /// `סוג`
  String get createRecipeStepTwoType {
    return Intl.message(
      'סוג',
      name: 'createRecipeStepTwoType',
      desc: '',
      args: [],
    );
  }

  /// `שם המצרך`
  String get createRecipeStepTwoIngredientName {
    return Intl.message(
      'שם המצרך',
      name: 'createRecipeStepTwoIngredientName',
      desc: '',
      args: [],
    );
  }

  /// `כמות`
  String get createRecipeTwoIngredientAmount {
    return Intl.message(
      'כמות',
      name: 'createRecipeTwoIngredientAmount',
      desc: '',
      args: [],
    );
  }

  /// `אפשרות`
  String get createRecipeTwoIngredientOption {
    return Intl.message(
      'אפשרות',
      name: 'createRecipeTwoIngredientOption',
      desc: '',
      args: [],
    );
  }

  /// `מידה`
  String get createRecipeTwoIngredientType {
    return Intl.message(
      'מידה',
      name: 'createRecipeTwoIngredientType',
      desc: '',
      args: [],
    );
  }

  /// `יצירת הוראות הכנה`
  String get createRecipeStepThree {
    return Intl.message(
      'יצירת הוראות הכנה',
      name: 'createRecipeStepThree',
      desc: '',
      args: [],
    );
  }

  /// `הוראות הכנה מספר: {index}`
  String createRecipeStepThreeInsturactionCardTitle(Object index) {
    return Intl.message(
      'הוראות הכנה מספר: $index',
      name: 'createRecipeStepThreeInsturactionCardTitle',
      desc: '',
      args: [index],
    );
  }

  /// `צריך כאן טיימר`
  String get createRecipeStepThreeNeedTimer {
    return Intl.message(
      'צריך כאן טיימר',
      name: 'createRecipeStepThreeNeedTimer',
      desc: '',
      args: [],
    );
  }

  /// `הקלד/י הוראות הכנה`
  String get createRecipeStepThreeAddInstruction {
    return Intl.message(
      'הקלד/י הוראות הכנה',
      name: 'createRecipeStepThreeAddInstruction',
      desc: '',
      args: [],
    );
  }

  /// `זמן`
  String get createRecipeStepThreeTimer {
    return Intl.message(
      'זמן',
      name: 'createRecipeStepThreeTimer',
      desc: '',
      args: [],
    );
  }

  /// `יחידה`
  String get unit {
    return Intl.message(
      'יחידה',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `גרם`
  String get gram {
    return Intl.message(
      'גרם',
      name: 'gram',
      desc: '',
      args: [],
    );
  }

  /// `כפית`
  String get spoon {
    return Intl.message(
      'כפית',
      name: 'spoon',
      desc: '',
      args: [],
    );
  }

  /// `ק״ג`
  String get kg {
    return Intl.message(
      'ק״ג',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `כוס`
  String get cup {
    return Intl.message(
      'כוס',
      name: 'cup',
      desc: '',
      args: [],
    );
  }

  /// `מ״ל`
  String get ml {
    return Intl.message(
      'מ״ל',
      name: 'ml',
      desc: '',
      args: [],
    );
  }

  /// `כף`
  String get tableSpoon {
    return Intl.message(
      'כף',
      name: 'tableSpoon',
      desc: '',
      args: [],
    );
  }

  /// `יחידות`
  String get units {
    return Intl.message(
      'יחידות',
      name: 'units',
      desc: '',
      args: [],
    );
  }

  /// `כפות`
  String get spoons {
    return Intl.message(
      'כפות',
      name: 'spoons',
      desc: '',
      args: [],
    );
  }

  /// `כוסות`
  String get cups {
    return Intl.message(
      'כוסות',
      name: 'cups',
      desc: '',
      args: [],
    );
  }

  /// `כפיות`
  String get tableSpoons {
    return Intl.message(
      'כפיות',
      name: 'tableSpoons',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get emptyString {
    return Intl.message(
      '',
      name: 'emptyString',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'he'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
