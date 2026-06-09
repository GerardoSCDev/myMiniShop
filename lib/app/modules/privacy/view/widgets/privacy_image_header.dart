import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';

extension PrivacyImageHeader on PrivacyScreen {
  Padding imageHeader(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.lgPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image(
          image: AssetImage('assets/privacy/privacy.png'),
          fit: BoxFit.contain,
          width: size.width * 0.7,
        ),
      ),
    );
  }
}
