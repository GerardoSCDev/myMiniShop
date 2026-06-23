class FormProductsState {
  final bool isLoadSearchProducts;
  final String barcodeText;
  final String productName;
  final String category;
  final String constPrice;
  final String salesPrice;
  final int initStock;
  final int lowStock;

  const FormProductsState({
    required this.isLoadSearchProducts,
    required this.barcodeText,
    required this.productName,
    required this.category,
    required this.constPrice,
    required this.salesPrice,
    required this.initStock,
    required this.lowStock,
  });

  factory FormProductsState.initial() {
    return const FormProductsState(
      isLoadSearchProducts: false,
      barcodeText: '',
      productName: '',
      category: '',
      constPrice: '',
      salesPrice: '',
      initStock: 0,
      lowStock: 0,
    );
  }

  FormProductsState copyWith({
    bool? isLoadSearchProducts,
    String? barcodeText,
    String? productName,
    String? category,
    String? constPrice,
    String? salesPrice,
    int? initStock,
    int? lowStock,
  }) {
    return FormProductsState(
      isLoadSearchProducts: isLoadSearchProducts ?? this.isLoadSearchProducts,
      barcodeText: barcodeText ?? this.barcodeText,
      productName: productName ?? this.productName,
      category: category ?? this.category,
      constPrice: constPrice ?? this.constPrice,
      salesPrice: salesPrice ?? this.salesPrice,
      initStock: initStock ?? this.initStock,
      lowStock: lowStock ?? this.lowStock,
    );
  }

  @override
  String toString() {
    return '''
FormProductsState(
  isLoadSearchProducts: $isLoadSearchProducts,
  barcodeText: $barcodeText,
  productName: $productName,
  category: $category,
  constPrice: $constPrice,
  salesPrice: $salesPrice,
  initStock: $initStock,
  lowStock: $lowStock,
)
''';
  }
}
