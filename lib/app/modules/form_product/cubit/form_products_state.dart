class FormProductsState {
  final bool isLoadSearchProducts;

  final String barcodeText;

  const FormProductsState({
    required this.isLoadSearchProducts,
    required this.barcodeText,
  });

  factory FormProductsState.initial() {
    return const FormProductsState(
      isLoadSearchProducts: false,
      barcodeText: '',
    );
  }

  FormProductsState copyWith({
    bool? isLoadSearchProducts,
    String? barcodeText,
  }) {
    return FormProductsState(
      isLoadSearchProducts: isLoadSearchProducts ?? this.isLoadSearchProducts,
      barcodeText: barcodeText ?? this.barcodeText,
    );
  }
}
