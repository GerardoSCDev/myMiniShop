import 'package:my_mini_shop/app/common/network/manager/api_response.dart';

class GetProductResponse extends ApiResponse {

  final String productName;

  const GetProductResponse({
    required this.productName,
  });

  factory GetProductResponse.fromJson(Map<String, dynamic> json) {
    final product = json['product'] as Map<String, dynamic>?;

    return GetProductResponse(
      productName: product?['product_name'] as String? ?? '',
    );
  }
}
