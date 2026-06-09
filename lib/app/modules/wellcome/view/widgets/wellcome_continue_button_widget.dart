import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_mini_shop/app/common/router/app_router.dart';
import 'package:my_mini_shop/app/modules/wellcome/config/wellcome_copies.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/wellcome_screen.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_button/app_button.dart';

extension WellcomeContinueButtonWidget on WellcomeScreen {
  Padding continueButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: AppButton(
        text: WellcomeCopies.continueButton,
        onPressed: () {
          context.push(PrivacyRouter.path);
        },
      ),
    );
  }
}
