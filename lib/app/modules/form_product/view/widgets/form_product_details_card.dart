import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_card_container/app_card_container.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text_field/app_text_field.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';
import 'package:my_mini_shop/app/modules/form_product/cubit/form_products_cubit.dart';

Widget formProductDetailsCard({
  required TextEditingController productNameController,
  required TextEditingController categoryController,
  required TextEditingController costPriceController,
  required TextEditingController salesPriceController,
  required TextEditingController initStockController,
  required TextEditingController lowStockController,
  required FormProductsCubit cubit,
}) {
  return AppCardContainer(
    child: Column(
      spacing: AppSize.smPadding,
      children: [
        AppTextField(
          controller: productNameController,
          label: FormProductCopies.productNameLabel,
          hint: FormProductCopies.productNameHint,
          onChanged: cubit.productNameChanged,
        ),
        AppTextField(
          controller: categoryController,
          label: FormProductCopies.categoryLabel,
          hint: FormProductCopies.categoryHint,
          onChanged: cubit.categoryChanged,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: costPriceController,
                label: FormProductCopies.costPriceLabel,
                hint: FormProductCopies.priceHint,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: cubit.constPriceChanged,
              ),
            ),
            SizedBox(
              width: AppSize.smPadding,
            ),
            Expanded(
              child: AppTextField(
                controller: salesPriceController,
                label: FormProductCopies.salePriceLabel,
                hint: FormProductCopies.priceHint,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: cubit.salesPriceChanged,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: initStockController,
                label: FormProductCopies.initialStockLabel,
                hint: FormProductCopies.initialStockHint,
                keyboardType: TextInputType.number,
                onChanged: cubit.initStockChanged,
              ),
            ),
            SizedBox(
              width: AppSize.smPadding,
            ),
            Expanded(
              child: AppTextField(
                controller: lowStockController,
                label: FormProductCopies.lowStockAlertLabel,
                hint: FormProductCopies.lowStockAlertHint,
                keyboardType: TextInputType.number,
                suffixButtonIcon: Icons.info_outline_rounded,
                onChanged: cubit.lowStockChanged,
                onSuffixButtonPressed: () {
                  // acción del botón
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
