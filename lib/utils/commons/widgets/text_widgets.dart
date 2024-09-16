import 'package:flutter/material.dart';
import 'package:taskmanagement/res/color_constants.dart';


/// bodyLarge - Font Size - 16 -> Body -400
/// titleMedium - Font Size - 16 -> Subtitle -500
/// headlineSmall - Font Size - 24 -> Title - 700


/// bodyLarge - Font Size - 16
class BodyLargeText extends StatelessWidget {
  const BodyLargeText(
      {super.key,
      required this.title,
      this.titleColor,
      this.titleTextAlign = TextAlign.left,
      this.maxLine,
      this.fontWeight,
      this.softWrap,
      this.fontStyle,
      this.textScaleFactor,
      this.fontSize,
      this.fontHeight,
      this.lineHeight,
      this.isUnderline = false});

  final String title;
  final double? fontSize;
  final Color? titleColor;
  final TextAlign titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final bool? softWrap;
  final double? textScaleFactor;
  final double? fontHeight;
  final bool? isUnderline;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaler: TextScaler.noScaling,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: titleColor ?? Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: fontWeight,
            decoration: isUnderline == true ? TextDecoration.underline : null,
            height: lineHeight,
          ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
    );
  }
}

/// titleSmall - Font Size - 14
class Subtitle extends StatelessWidget {
  const Subtitle(
      {super.key,
      required this.title,
      this.titleColor,
      this.titleTextAlign = TextAlign.left,
      this.maxLine,
      this.fontWeight,
      this.softWrap,
      this.fontStyle,
      this.textScaleFactor,
      this.fontSize,
      this.fontHeight,
      this.lineHeight,
      this.isUnderline = false});

  final String title;
  final double? fontSize;
  final Color? titleColor;
  final TextAlign titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final bool? softWrap;
  final double? textScaleFactor;
  final double? fontHeight;
  final bool? isUnderline;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaler: TextScaler.noScaling,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: titleColor ?? Theme.of(context).textTheme.titleSmall?.color,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: 14,
            decoration: isUnderline == true ? TextDecoration.underline : null,
            height: lineHeight,
            fontFamily: "DMSans"
          ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
    );
  }
}

/// titleMedium - Font Size - 16
class TitleText extends StatelessWidget {
  const TitleText(
      {super.key,
      required this.title,
      this.titleColor,
      this.titleTextAlign = TextAlign.left,
      this.maxLine,
      this.fontWeight,
      this.softWrap,
      this.fontStyle,
      this.textScaleFactor,
      this.fontSize,
      this.fontHeight,
      this.lineHeight,
      this.isUnderline = false});

  final String title;
  final double? fontSize;
  final Color? titleColor;
  final TextAlign titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final bool? softWrap;
  final double? textScaleFactor;
  final double? fontHeight;
  final bool? isUnderline;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaler: TextScaler.noScaling,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: titleColor ?? Theme.of(context).textTheme.titleMedium?.color,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: isUnderline == true ? TextDecoration.underline : null,
          height: lineHeight,
          fontSize: 16,
          fontFamily: "DMSans"
      ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,

    );
  }
}

/// titleLarge - Font Size - 22
class HeadlineText extends StatelessWidget {
  const HeadlineText(
      {super.key,
      required this.title,
      this.titleColor,
      this.titleTextAlign = TextAlign.left,
      this.maxLine,
      this.fontWeight,
      this.softWrap,
      this.fontStyle,
      this.textScaleFactor,
      this.fontSize,
      this.fontHeight,
      this.lineHeight,
      this.isUnderline = false});

  final String title;
  final double? fontSize;
  final Color? titleColor;
  final TextAlign titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final bool? softWrap;
  final double? textScaleFactor;
  final double? fontHeight;
  final bool? isUnderline;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaler: TextScaler.noScaling,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: titleColor ?? ColorConstants.blackColor,
          fontWeight: fontWeight ?? FontWeight.w700,
          decoration: isUnderline == true ? TextDecoration.underline : null,
          height: lineHeight,
          fontSize: 22,
          fontFamily: "DMSans"
      ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
    );
  }
}
