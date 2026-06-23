import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_mini_shop/app/common/design/widgets/app_image_uploader/app_image_uploader.dart';
import 'package:my_mini_shop/app/modules/form_product/config/form_product_copies.dart';

Widget formProductImageUploader({
  required XFile? selectedImage,
  required ValueChanged<XFile> onImageSelected,
}) {
  return AppImageUploader(
    title: FormProductCopies.productImageLabel,
    image: selectedImage == null ? null : FileImage(File(selectedImage.path)),
    onImageSelected: onImageSelected,
  );
}
