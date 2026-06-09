import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_scaffold/app_scaffold.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/widgets/wellcome_brand_text.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/widgets/wellcome_continue_button_widget.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/widgets/wellcome_image_widget.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/widgets/wellcome_sub_title_widget.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/widgets/wellcome_title_widget.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBackButton: false,
      body: Column(
        children: [
          image(context),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: title(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: subTitle(),
          ),
          Spacer(),
          continueButton(context),
          brandText(),
        ],
      ),
    );
  }
}
