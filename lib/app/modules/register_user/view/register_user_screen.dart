import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_scaffold/app_scaffold.dart';
import 'package:my_mini_shop/app/modules/register_user/config/register_user_copies.dart';
import 'package:my_mini_shop/app/modules/register_user/view/widget/register_user_app_text_field_user.dart';
import 'package:my_mini_shop/app/modules/register_user/view/widget/register_user_sub_title.dart';
import 'package:my_mini_shop/app/modules/register_user/view/widget/register_user_success_button.dart';
import 'package:my_mini_shop/app/modules/register_user/view/widget/register_user_title.dart';

class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleAppBar: RegisterUserCopies.topNavBarTitle,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title(),

          subTitle(),

          textFieldUser(),

          Spacer(),

          successButton(context),
        ],
      ),
    );
  }
}
