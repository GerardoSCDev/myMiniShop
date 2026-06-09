import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_background_container/app_background_container.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_nav_bar/app_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  final String titleAppBar;
  final bool showBackButton;
  final Widget body;

  const AppScaffold({
    super.key,
    required this.body,
    this.titleAppBar = '',
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: AppBackgroundContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppNavBar(
            showBackButton: showBackButton,
            title: titleAppBar,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.lgPadding),
            child: body,
          ),
        ),
      ),
    );
  }
}
