import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_button/app_button.dart';
import 'package:my_mini_shop/app/modules/privacy/config/privacy_copies.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_comple_terms.dart';

extension PrivacyDeclineButton on PrivacyScreen {
  Padding declineButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.lgPadding),
      child: AppButton(
        text: PrivacyCopies.declineButton,
        typeButton: TypeButton.secondary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const FractionallySizedBox(
              heightFactor: 0.94,
              child: PrivacyCompleTerms(),
            ),
          );
        },
      ),
    );
  }
}
