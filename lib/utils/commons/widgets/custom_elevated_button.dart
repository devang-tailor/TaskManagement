import 'package:flutter/material.dart';
import 'package:taskmanagement/res/color_constants.dart';
import 'package:taskmanagement/utils/commons/widgets/text_widgets.dart';

class CustomElevatedButtonExpanded extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;

  const CustomElevatedButtonExpanded({
    super.key,
    required this.text,
    required this.onPressed,
    this.color, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5 - 24,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor ?? ColorConstants.whiteColor,
          backgroundColor: color ?? ColorConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: TitleText(
          title: text,
          titleColor: ColorConstants.whiteColor,
        ),
      ),
    );
  }
}
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.10, MediaQuery.of(context).size.height * 0.05),
        foregroundColor: textColor ?? ColorConstants.whiteColor,
        backgroundColor: color ?? ColorConstants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: TitleText(
        title: text,
        titleColor: ColorConstants.whiteColor,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 16 ,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor ?? ColorConstants.whiteColor,
          backgroundColor: color ?? ColorConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: TitleText(
          title: text,
          titleColor: ColorConstants.whiteColor,
        ),
      ),
    );
  }
}

