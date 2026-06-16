import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_text/app_text.dart';

class AppImageUploader extends StatelessWidget {
  final String title;
  final ValueChanged<XFile> onImageSelected;
  final ImageProvider? image;

  const AppImageUploader({
    super.key,
    required this.onImageSelected,
    this.title = '',
    this.image,
  });

  static const Color green = Color(0xFF007A4D);
  static const Color borderColor = Color(0xFFB5C4B6);
  static const Color bgColor = Color(0xFFEFF3F8);

  Future<void> _openImageSourceSheet(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => const _ImageSourceSheet(),
    );

    if (source == null) return;

    final picker = ImagePicker();
    final selectedImage = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (selectedImage == null) return;

    onImageSelected(selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: TextFontSize.large,
          fontWeight: TextWeight.semiBold,
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () => _openImageSourceSheet(context),
          child: CustomPaint(
            painter: DashedRoundedBorderPainter(
              color: borderColor,
              strokeWidth: 4,
              radius: 26,
              dashWidth: 9,
              dashSpace: 7,
            ),
            child: Container(
              width: double.infinity,
              height: 290,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(26),
                image: image == null
                    ? null
                    : DecorationImage(
                        image: image!,
                        fit: BoxFit.cover,
                      ),
              ),
              child: image == null ? const _UploadPlaceholder() : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageSourceSheet extends StatelessWidget {
  const _ImageSourceSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const AppText(
                text: 'Abrir cámara',
                fontWeight: TextWeight.semiBold,
              ),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const AppText(
                text: 'Abrir galería',
                fontWeight: TextWeight.semiBold,
              ),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadPlaceholder extends StatelessWidget {
  const _UploadPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add_a_photo_outlined,
            size: 86,
            color: AppImageUploader.green,
          ),
          SizedBox(height: 24),
          AppText(
            text: 'Subir fotografía',
            fontSize: TextFontSize.large,
            fontWeight: TextWeight.semiBold,
          ),
        ],
      ),
    );
  }
}

class DashedRoundedBorderPainter extends CustomPainter {
  const DashedRoundedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
    required this.dashWidth,
    required this.dashSpace,
  });

  final Color color;
  final double strokeWidth;
  final double radius;
  final double dashWidth;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final path = Path()..addRRect(rrect);

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedRoundedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
