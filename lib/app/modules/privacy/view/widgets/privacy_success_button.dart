import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_button/app_button.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/router/app_router.dart';
import 'package:my_mini_shop/app/modules/privacy/config/privacy_copies.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';

extension PrivacySuccessButton on PrivacyScreen {
  Padding successButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.xsPadding),
      child: AppButton(
        text: PrivacyCopies.successButton,
        onPressed: () {
          context.push(RegisterUserRouter.path);
        },
      ),
    );
  }
}
