// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a he locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'he';

  static String m0(fullName) => "היי ${fullName},\n מה בתפריט של היום ?";

  static String m1(ingredientsAmount, unit) => "${ingredientsAmount} ${unit}";

  static String m2(time) => "טיימר: ${time} דקות";

  static String m3(ingredientsLength) =>
      "הרכיבים שצריך: (${ingredientsLength})";

  static String m4(number) => "#${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "acceptButton": MessageLookupByLibrary.simpleMessage("אישור"),
        "appName": MessageLookupByLibrary.simpleMessage("המתכונים של ממושית"),
        "categoryNoRecipes":
            MessageLookupByLibrary.simpleMessage("אין מתכונים בקטגוריה זו"),
        "categoryRecipeScreenSearchText":
            MessageLookupByLibrary.simpleMessage("ניתן לחפש לפי שם המתכון"),
        "completeProfileScreenCamera":
            MessageLookupByLibrary.simpleMessage("מצלמה"),
        "completeProfileScreenError":
            MessageLookupByLibrary.simpleMessage("חובה לפחות תו אחד"),
        "completeProfileScreenFullName":
            MessageLookupByLibrary.simpleMessage("שם מלא"),
        "completeProfileScreenGallery":
            MessageLookupByLibrary.simpleMessage("גלרייה"),
        "completeProfileScreenWhoCooking":
            MessageLookupByLibrary.simpleMessage("מי הממוש שמבשל/ת פה?"),
        "emptyString": MessageLookupByLibrary.simpleMessage(""),
        "gram": MessageLookupByLibrary.simpleMessage("גרם"),
        "homeScreenHelloAndWelcome": m0,
        "homeScreenMainCategories":
            MessageLookupByLibrary.simpleMessage("קטגוריות ראשיות"),
        "phoneInputScreenError":
            MessageLookupByLibrary.simpleMessage("שדה זה אינו בפורמט התקין"),
        "phoneInputScreenInsertPhone":
            MessageLookupByLibrary.simpleMessage("הזנ/י מספר טלפון"),
        "recipeAmount": m1,
        "recipeInstructionTimer": m2,
        "recipeScreen": m3,
        "recipeScreenFinishedRecipe":
            MessageLookupByLibrary.simpleMessage("סיימתי"),
        "recipeScreenInstruction":
            MessageLookupByLibrary.simpleMessage("הוראות הכנה"),
        "recipeScreenInstructionNumber": m4,
        "splashScreenDescription":
            MessageLookupByLibrary.simpleMessage("כל המתכונים במקום אחד"),
        "splashScreenTitle": MessageLookupByLibrary.simpleMessage("Mamush"),
        "unit": MessageLookupByLibrary.simpleMessage("יחידה"),
        "userProfileCardDisconnect":
            MessageLookupByLibrary.simpleMessage("התנתק"),
        "userProfileCardEditProfile":
            MessageLookupByLibrary.simpleMessage("עריכת פרופיל"),
        "userProfileScreenGoBack":
            MessageLookupByLibrary.simpleMessage("למסך הבית"),
        "userProfileScreenProfileOf":
            MessageLookupByLibrary.simpleMessage("הפרופיל של")
      };
}
