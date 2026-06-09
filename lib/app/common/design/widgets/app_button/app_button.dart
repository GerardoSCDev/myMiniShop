import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double height;
  final VoidCallback? onPressed;
  final TypeButton typeButton;

  const AppButton({
    super.key,
    required this.text,
    this.height = 55,
    this.onPressed,
    this.typeButton = TypeButton.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: typeButton.style,
        child: AppText(
          text: text,
          fontSize: TextFontSize.medium,
        ),
      ),
    );
  }
}

enum TypeButton { primary, secondary }

extension TypeButtonStyle on TypeButton {
  ButtonStyle get style {
    switch (this) {
      case TypeButton.primary:
        return AppButtonStyle.primaryStyle;
      case TypeButton.secondary:
        return AppButtonStyle.secondaryStyle;
    }
  }
}

class AppButtonStyle {
  static final ButtonStyle primaryStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(AppColors.bgEnablePrimaryButton),
    foregroundColor: WidgetStatePropertyAll(AppColors.textEnablePrimaryButton),
  );

  static final ButtonStyle secondaryStyle = ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    shadowColor: WidgetStatePropertyAll(AppColors.bgEnableSecondaryButton),
    backgroundColor: WidgetStatePropertyAll(AppColors.bgEnableSecondaryButton),
    foregroundColor: WidgetStatePropertyAll(
      AppColors.textEnableSecondaryButton,
    ),
    side: WidgetStatePropertyAll(
      BorderSide(
        width: 2.0, // Set your desired border width here
        color: AppColors.borderEnableSecondaryButton, // Set the border color
      ),
    ),
  );
}
