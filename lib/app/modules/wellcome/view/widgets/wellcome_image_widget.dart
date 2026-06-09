import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/wellcome_screen.dart';

extension WellcomeImageWidget on WellcomeScreen {
  Widget image(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Image(
      image: AssetImage('assets/wellcome/wellcome.png'),
      fit: BoxFit.contain,
      width: size.width * 0.8,
    );
  }
}
