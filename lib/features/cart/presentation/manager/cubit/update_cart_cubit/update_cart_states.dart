import 'package:shopping_app/features/cart/data/models/update_cart_model/update_cart_model.dart';

abstract class UpdateCartStates{}

class UpdateCartInitialState extends UpdateCartStates{}

class UpdateCartSuccessState extends UpdateCartStates{
  final UpdateCartModel updateCartModel;

  UpdateCartSuccessState(this.updateCartModel);
}

class UpdateCartFailureState extends UpdateCartStates{
  final String errorMessage;

  UpdateCartFailureState(this.errorMessage);
}