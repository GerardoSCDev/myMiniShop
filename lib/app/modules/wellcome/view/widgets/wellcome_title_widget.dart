import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/wellcome/config/wellcome_copies.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/wellcome_screen.dart';

extension WellcomeTitleWidget on WellcomeScreen {
  Widget title() {
    return AppText(
      text: WellcomeCopies.title,
      fontSize: TextFontSize.large,
      fontWeight: TextWeight.bold,
      color: AppColors.textSubtitle,
    );
  }
}
