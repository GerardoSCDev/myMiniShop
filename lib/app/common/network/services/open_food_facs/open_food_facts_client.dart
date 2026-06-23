import 'package:my_mini_shop/app/common/network/manager/api_client.dart';

class OpenFoodFactsClient {
  OpenFoodFactsClient()
      : apiClient = ApiClient(
          baseUrl: 'https://world.openfoodfacts.org',
        );

  final ApiClient apiClient;
}