import 'package:flutter/material.dart';

class PrivacyContainerContet extends StatelessWidget {
  final Widget child;

  const PrivacyContainerContet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFBBCABF), width: 1),
      ),
      padding: EdgeInsets.all(16),
      child: child,
    );
  }
}