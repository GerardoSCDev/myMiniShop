import 'package:my_mini_shop/app/common/network/manager/network_result.dart';
import 'package:my_mini_shop/app/common/network/services/open_food_facs/end_point/get_product/get_product_end_point.dart';
import 'package:my_mini_shop/app/common/network/services/open_food_facs/end_point/get_product/get_product_response.dart';
import 'package:my_mini_shop/app/common/network/services/open_food_facs/open_food_facts_client.dart';

class OpenFoodFactsRepository {
  const OpenFoodFactsRepository({
    required OpenFoodFactsClient client,
  }) : _client = client;

  final OpenFoodFactsClient _client;

  Future<NetworkResult<GetProductResponse>> getProductByBarcode({
    required String barcode,
  }) async {
    return _client.apiClient.request<GetProductResponse>(
      GetProductEndPoint(
        barcode: barcode,
      ),
    );
  }
}
