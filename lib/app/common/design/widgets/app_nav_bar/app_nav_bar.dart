import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:my_mini_shop/app/common/design/colors/app_colors.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const AppNavBar({super.key, this.title = '', this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: false,
      title: AppText(
        text: title,
        fontSize: TextFontSize.large,
        fontWeight: TextWeight.bold,
        color: AppColors.navBarTitle,
      ),
      leading: _getBackButton(context),
    );
  }

  IconButton? _getBackButton(BuildContext context) {
    return !showBackButton
        ? null
        : IconButton(
            icon: Icon(Icons.arrow_circle_left_outlined),
            onPressed: () {
              context.pop();
            },
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
