import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';

class AppText extends StatelessWidget {
  static const String fontFamily = 'PlusJakartaSans';

  final String text;
  final TextFontSize fontSize;
  final TextWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText({
    super.key,
    this.text = '',
    this.fontSize = TextFontSize.medium,
    this.fontWeight = TextWeight.normal,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize.value,
        fontWeight: fontWeight.value,
      ),
    );
  }
}

enum TextWeight { normal, bold, semiBold }

extension TextWeightSelected on TextWeight {
  FontWeight get value {
    switch (this) {
      case TextWeight.normal:
        return FontWeight.w400;
      case TextWeight.bold:
        return FontWeight.w700;
      case TextWeight.semiBold:
        return FontWeight.w600;
    }
  }
}

enum TextFontSize { large, medium, small }

extension TextFontSizeSelected on TextFontSize {
  double get value {
    switch (this) {
      case TextFontSize.large:
        return AppSize.lgText;
      case TextFontSize.medium:
        return AppSize.mdText;
      case TextFontSize.small:
        return AppSize.smText;
    }
  }
}
