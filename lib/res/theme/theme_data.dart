import 'package:taskmanagement/res/exports/common_exports.dart';

class Themes{
  static ThemeData themeData = ThemeData(
    fontFamily: 'DMSans',
    useMaterial3: true,
    colorSchemeSeed: ColorConstants.primaryColor,
    scaffoldBackgroundColor: ColorConstants.scaffoldColor,
    appBarTheme: AppBarTheme(color: ColorConstants.primaryColor, elevation: 0, scrolledUnderElevation: 0),
    dividerColor: ColorConstants.blackColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorConstants.primaryColor,
      selectionColor: ColorConstants.primaryColor.withOpacity(0.4),
      selectionHandleColor: ColorConstants.primaryColor,
    ),
  );
}
