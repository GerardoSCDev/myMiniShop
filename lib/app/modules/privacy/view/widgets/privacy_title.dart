import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/privacy/config/privacy_copies.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';

extension PrivacyTitle on PrivacyScreen {
  Padding title() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.smPadding),
      child: AppText(
        text: PrivacyCopies.title,
        fontSize: TextFontSize.large,
        fontWeight: TextWeight.bold,
      ),
    );
  }
}
