import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/core/utils/end_points.dart';
import 'package:shopping_app/features/cart/data/data_sources/cart_remote_data_source/cart_remote_data_source.dart';
import 'package:shopping_app/features/cart/data/models/update_cart_model/update_cart_model.dart';

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl(this.apiService);

  @override
  Future<UpdateCartModel> updateCart(int id) async {
    Map<String, dynamic> response =
        await apiService.post(endPoint: EndPoints.carts, data: {
      'product_id': id,
    });
    UpdateCartModel updateCartModel = UpdateCartModel.fromJson(response);
    return updateCartModel;
  }
}
