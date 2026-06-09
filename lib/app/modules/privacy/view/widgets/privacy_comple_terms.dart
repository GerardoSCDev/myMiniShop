import 'package:flutter/material.dart';
import 'package:my_mini_shop/app/common/design/size/app_size.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';

class PrivacyCompleTerms extends StatelessWidget {
  const PrivacyCompleTerms({super.key});

  static const Color _titleColor = Color(0xFF0D1C2F);
  static const Color _borderColor = Color(0xFFBBCABF);
  static const Color _sheetColor = Color(0xFFF8F9FF);
  static const PrivacyTermsContent _termsContent = PrivacyTermsContent(
    titleTerms: 'Última actualización: Octubre 2023',
    description:
        'En Mi Tiendita, valoramos profundamente la confianza que depositas en nosotros al compartir tu información comercial. Este aviso detalla cómo manejamos tus datos.',
    points: [
      PrivacyTermPoint(
        title: '1. Recolección de Datos',
        description:
            'Recopilamos información básica sobre tus productos, inventarios y transacciones de venta con el único propósito de proporcionarte herramientas de gestión empresarial eficientes.',
      ),
      PrivacyTermPoint(
        title: '2. Uso de la Información',
        description:
            'Tus datos se utilizan exclusivamente para generar reportes de ventas, alertas de stock bajo y análisis de rendimiento. No compartimos tus datos con terceros para fines comerciales.',
      ),
      PrivacyTermPoint(
        title: '3. Seguridad',
        description:
            'Implementamos protocolos de seguridad estándar de la industria para proteger la integridad de tu base de datos contra accesos no autorizados.',
      ),
      PrivacyTermPoint(
        title: '4. Derechos ARCO',
        description:
            'Puedes ejercer tus derechos de Acceso, Rectificación, Cancelación y Oposición en cualquier momento a través de la configuración de tu perfil.',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _sheetColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: _borderColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSize.lgPadding),
              child: Row(
                children: [
                  const Expanded(
                    child: AppText(
                      text: 'Aviso de Privacidad',
                      fontSize: TextFontSize.large,
                      fontWeight: TextWeight.bold,
                      color: _titleColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: _titleColor,
                      size: 34,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0.1,
              thickness: 2,
              color: _borderColor,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppSize.lgPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: _termsContent.titleTerms,
                      fontSize: TextFontSize.large,
                      fontWeight: TextWeight.semiBold,
                    ),
                    const SizedBox(height: 28),
                    AppText(
                      text: _termsContent.description,
                      fontSize: TextFontSize.medium,
                      fontWeight: TextWeight.normal,
                    ),

                    const SizedBox(height: 28),
                    for (final point in _termsContent.points) ...[
                      AppText(
                        text: point.title,
                        fontSize: TextFontSize.medium,
                        fontWeight: TextWeight.semiBold,
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: point.description,
                        fontSize: TextFontSize.medium,
                        fontWeight: TextWeight.normal,
                      ),
                      const SizedBox(height: 28),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyTermsContent {
  final String titleTerms;
  final String description;
  final List<PrivacyTermPoint> points;

  const PrivacyTermsContent({
    required this.titleTerms,
    required this.description,
    required this.points,
  });
}

class PrivacyTermPoint {
  final String title;
  final String description;

  const PrivacyTermPoint({
    required this.title,
    required this.description,
  });
}
