import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/privacy/config/privacy_copies.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';

extension PrivacyDescription on PrivacyScreen {
  Padding description() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.lgPadding),
      child: AppText(
        text: PrivacyCopies.description,
        fontSize: TextFontSize.medium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
