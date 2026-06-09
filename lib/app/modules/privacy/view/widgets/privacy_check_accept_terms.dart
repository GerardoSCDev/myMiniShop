import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/privacy/config/privacy_copies.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';

extension PrivacyCheckAcceptTerms on PrivacyScreen {
  Row checkAcceptTerms() {
    return Row(
      children: [
        Column(
          children: [
            Checkbox(value: false, onChanged: (bool? value) {}),
          ],
        ),
        Expanded(
          child: AppText(
            text: PrivacyCopies.acceptTerms,
            fontSize: TextFontSize.small,
          ),
        ),
      ],
    );
  }
}
