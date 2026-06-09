import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/wellcome/config/wellcome_copies.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/wellcome_screen.dart';

extension WellcomeBrandTextWidget on WellcomeScreen {
  Padding brandText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: AppText(
        text: WellcomeCopies.brandBottom,
        fontSize: TextFontSize.small,
      ),
    );
  }
}
