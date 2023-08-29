import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/cart/data/models/update_cart_model/update_cart_model.dart';
import 'package:shopping_app/features/cart/domain/use_cases/update_cart_use_case.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/update_cart_cubit/update_cart_states.dart';

class UpdateCartCubit extends Cubit<UpdateCartStates> {
  final UpdateCartUseCase updateCartUseCase;

  UpdateCartCubit(this.updateCartUseCase) : super(UpdateCartInitialState());

  Future updateCart(int id) async {
    Either<Failure, UpdateCartModel> result = await updateCartUseCase.call(id);

    if (isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(UpdateCartFailureState(failure.message)),
      (updateCartModel) => emit(UpdateCartSuccessState(updateCartModel)),
    );
  }
}
