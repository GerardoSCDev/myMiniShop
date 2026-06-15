import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_button/app_button.dart';
import 'package:my_mini_shop/app/modules/register_user/config/register_user_copies.dart';
import 'package:my_mini_shop/app/modules/register_user/view/register_user_screen.dart';

extension RegisterUserSuccessButton on RegisterUserScreen {
  Padding successButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.lgPadding),
      child: AppButton(text: RegisterUserCopies.successButtonTitle),
    );
  }
}
