import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_button/app_button.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';

Widget formProductSaveButton({
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSize.xlPadding),
    child: AppButton(
      text: FormProductCopies.saveButton,
      onPressed: onPressed,
    ),
  );
}
