import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_card_container/app_card_container.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text_field/app_text_field.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';
import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_cubit.dart';

Widget formProductBarcodeField({
  required TextEditingController controller,
  required VoidCallback onScanPressed,
  required BuildContext context
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
            onSubmitted: (value) {
              context.read<FormProductsCubit>().searchProduct(value);
            },
          ),
        ),
      ],
    ),
  );
}
