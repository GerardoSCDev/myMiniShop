import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_scaffold/app_scaffold.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_check_accept_terms.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_decline_button.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_image_header.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_review_points.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_success_button.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_title.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_description.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyScreen = Column(
      children: [
        imageHeader(context),

        title(),

        description(),

        containerPoints(),

        checkAcceptTerms(),

        Spacer(),

        successButton(),

        declineButton(context),
      ],
    );

    return AppScaffold(body: bodyScreen);
  }
}
