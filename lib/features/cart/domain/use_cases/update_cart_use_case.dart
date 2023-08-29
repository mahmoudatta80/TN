import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/cart/data/models/update_cart_model/update_cart_model.dart';
import 'package:shopping_app/features/cart/domain/repos/cart_repo.dart';

class UpdateCartUseCase extends UseCaseWithParam<UpdateCartModel, int> {
  final CartRepo cartRepo;

  UpdateCartUseCase(this.cartRepo);

  @override
  Future<Either<Failure, UpdateCartModel>> call(int param) async {
    return await cartRepo.updateCart(param);
  }
}
