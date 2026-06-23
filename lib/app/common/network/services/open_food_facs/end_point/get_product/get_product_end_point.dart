import 'package:my_mini_shop/app/common/network/manager/api_endpoint.dart';
import 'package:my_mini_shop/app/common/network/manager/api_headers.dart';
import 'package:my_mini_shop/app/common/network/manager/http_method.dart';
import 'package:my_mini_shop/app/common/network/services/open_food_facs/end_point/get_product/get_product_response.dart';

class GetProductEndPoint extends ApiEndpoint<GetProductResponse> {
  GetProductEndPoint({required String barcode})
    : super(
        path: '',
        method: HttpMethod.get,
        headers: DefaultApiHeaders(),
        mapper: (json) =>
            GetProductResponse.fromJson(json as Map<String, dynamic>),
      );
}
