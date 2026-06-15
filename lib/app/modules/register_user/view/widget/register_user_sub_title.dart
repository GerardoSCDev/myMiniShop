import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/register_user/config/register_user_copies.dart';
import 'package:my_mini_shop/app/modules/register_user/view/register_user_screen.dart';

extension RegisterUserSubTitle on RegisterUserScreen {
  Padding subTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.lgPadding),
      child: AppText(
        text: RegisterUserCopies.subTitle,
      ),
    );
  }
}
