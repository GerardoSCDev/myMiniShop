import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_card_container/app_card_container.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text_field/app_text_field.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';

Widget formProductBarcodeField({
  required TextEditingController controller,
  required VoidCallback onScanPressed,
  required BuildContext context,
}) {
  return AppCardContainer(
    child: Row(
      children: [
        Expanded(
          child: AppTextField(
            controller: controller,
            label: FormProductCopies.barcodeLabel,
            hint: FormProductCopies.barcodeHint,
            suffixButtonIcon: Icons.barcode_reader,
            onSuffixButtonPressed: onScanPressed,
            onSubmitted: (value) {},
          ),
        ),
      ],
    ),
  );
}
