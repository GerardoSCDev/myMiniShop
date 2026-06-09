import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';

class AppBackgroundContainer extends StatelessWidget {
  final Widget child;

  const AppBackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: AppColors.bgPageRadialGradient,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
