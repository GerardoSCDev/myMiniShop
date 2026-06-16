import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String helperText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.helperText = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          fontSize: TextFontSize.medium,
          fontWeight: TextWeight.semiBold,
        ),

        SizedBox(height: AppSize.xsPadding),

        TextField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: AppSize.mdText,
            color: AppColors.appTextFieldText,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: AppSize.mdText,
              color: AppColors.appTextFieldHint,
            ),
            filled: true,
            fillColor: AppColors.appTextFieldBackground,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSize.mdPadding,
              vertical: AppSize.smPadding,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(
                color: AppColors.appTextFieldBorder,
                width: AppSize.borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(
                color: AppColors.appTextFieldBorder,
                width: AppSize.borderWidth,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),

        if (helperText.isNotEmpty) ...[
          SizedBox(height: AppSize.xsPadding),
          AppText(
            text: helperText,
            fontSize: TextFontSize.small,
            fontWeight: TextWeight.normal,
          ),
        ],
      ],
    );
  }
}
