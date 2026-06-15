import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/register_user/config/register_user_copies.dart';
import 'package:my_mini_shop/app/modules/register_user/view/register_user_screen.dart';

extension RegisterUserTitle on RegisterUserScreen {
  Padding title() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSize.mdPadding,
        top: AppSize.lgPadding,
      ),
      child: AppText(
        text: RegisterUserCopies.titlePage,
        fontSize: TextFontSize.large,
        fontWeight: TextWeight.bold,
      ),
    );
  }
}
