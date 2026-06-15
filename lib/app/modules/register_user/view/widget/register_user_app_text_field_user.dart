import 'package:my_mini_shop/app/common/design/widgets/app_text_field/app_text_field.dart';
import 'package:my_mini_shop/app/modules/register_user/config/register_user_copies.dart';
import 'package:my_mini_shop/app/modules/register_user/view/register_user_screen.dart';

extension RegisterUserAppTextFieldUser on RegisterUserScreen {
  AppTextField textFieldUser() {
    return AppTextField(
      label: RegisterUserCopies.appTextFieldUserLabel,
      hint: RegisterUserCopies.appTextFieldUserHint,
      helperText: RegisterUserCopies.appTextFieldUserHelperText,
    );
  }
}
