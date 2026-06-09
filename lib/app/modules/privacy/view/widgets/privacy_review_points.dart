import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_container_points.dart';
import 'package:my_mini_shop/app/modules/privacy/view/widgets/privacy_point.dart';

extension PrivacyTitle on PrivacyScreen {
  PrivacyContainerContet containerPoints() {
    return PrivacyContainerContet(
      child: Column(
        spacing: 24,
        children: [
          PrivacyPoint(point: PrivacyPointOption.inventoryControl),
          PrivacyPoint(point: PrivacyPointOption.totalSecurity),
          PrivacyPoint(point: PrivacyPointOption.anyAdds),
        ],
      ),
    );
  }
}
