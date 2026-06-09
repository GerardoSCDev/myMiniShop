import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';
import 'package:my_mini_shop/app/modules/privacy/config/privacy_copies.dart';

class PrivacyPoint extends StatelessWidget {
  final PrivacyPointOption point;

  const PrivacyPoint({
    super.key,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    final titlePoint = AppText(
      text: point.title,
      fontSize: TextFontSize.medium,
      fontWeight: TextWeight.semiBold,
      color: Color(0xFF0D1C2F),
    );

    final descriptionPoint = AppText(
      text: point.description,
      fontSize: TextFontSize.small,
      fontWeight: TextWeight.normal,
      color: Color(0xFF3C4A42),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        AppCircleIcon(
          pathImage: point.imagePath,
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titlePoint,
              descriptionPoint,
            ],
          ),
        ),
      ],
    );
  }
}

class AppCircleIcon extends StatelessWidget {
  final double size = 50;
  final Color backgroundColor = Color(0xFFE5EEFF);
  final Color iconColor = Color(0xFF006B4F);
  final double iconSize = 50;
  final String pathImage;

  AppCircleIcon({
    super.key,
    required this.pathImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration:
          const BoxDecoration(
            shape: BoxShape.circle,
          ).copyWith(
            color: backgroundColor,
          ),
      child: Center(
        child: Image(
          image: AssetImage(pathImage),
        ),
      ),
    );
  }
}

enum PrivacyPointOption { inventoryControl, totalSecurity, anyAdds }

extension PrivacyPointOptionValues on PrivacyPointOption {
  String get imagePath {
    switch (this) {
      case PrivacyPointOption.inventoryControl:
        return 'assets/privacy/privacy_box.png';
      case PrivacyPointOption.totalSecurity:
        return 'assets/privacy/privacy_padlock.png';
      case PrivacyPointOption.anyAdds:
        return 'assets/privacy/privacy_close_eye.png';
    }
  }

  String get title {
    switch (this) {
      case PrivacyPointOption.inventoryControl:
        return PrivacyCopies.privacyInventoryPointTitle;
      case PrivacyPointOption.totalSecurity:
        return PrivacyCopies.privacySecorityPointTitle;
      case PrivacyPointOption.anyAdds:
        return PrivacyCopies.privacyExternalAdPointTitle;
    }
  }

  String get description {
    switch (this) {
      case PrivacyPointOption.inventoryControl:
        return PrivacyCopies.privacyInventoryPointDescription;
      case PrivacyPointOption.totalSecurity:
        return PrivacyCopies.privacySecorityPointDescription;
      case PrivacyPointOption.anyAdds:
        return PrivacyCopies.privacyExternalAdPointDescription;
    }
  }
}
