import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_button/app_button.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_card_container/app_card_container.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_scaffold/app_scaffold.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text_field/app_text_field.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';

class FormProductScreen extends StatelessWidget {
  const FormProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleAppBar: FormProductCopies.title,
      body: Column(
        children: [
          AppCardContainer(
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: FormProductCopies.barcodeLabel,
                    hint: FormProductCopies.barcodeHint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
