import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_card_container/app_card_container.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';

Widget formProductStockNotificationsCard() {
  return AppCardContainer(
    backgroundColor: AppColors.bgAppCardContainer,
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              AppText(
                text: FormProductCopies.stockNotificationsTitle,
                fontWeight: TextWeight.semiBold,
              ),
              AppText(
                text: FormProductCopies.stockNotificationsDescription,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
