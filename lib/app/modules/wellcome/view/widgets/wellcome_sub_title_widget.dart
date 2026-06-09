import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/wellcome/config/wellcome_copies.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/wellcome_screen.dart';

extension WellcomeSubTitleWidget on WellcomeScreen {
  Widget subTitle() {
    return AppText(
      text: WellcomeCopies.subTitle,
      textAlign: TextAlign.center,
      fontSize: TextFontSize.medium,
      fontWeight: TextWeight.normal,
      color: AppColors.textTitle,
    );
  }
}
