import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/profile/data/models/update_favourite_model/update_favourite_model.dart';
import 'package:shopping_app/features/profile/domain/use_cases/update_favourite_use_case.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_favourite_cubit/update_favourite_states.dart';

class UpdateFavouriteCubit extends Cubit<UpdateFavouriteStates> {
  final UpdateFavouriteUseCase updateFavouriteUseCase;

  UpdateFavouriteCubit(this.updateFavouriteUseCase)
      : super(UpdateFavouriteInitialState());

  Future updateFavourite(int id) async {
    Either<Failure, UpdateFavouriteModel> result =
        await updateFavouriteUseCase.call(id);

    if (isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(UpdateFavouriteFailureState(failure.message)),
      (updateFavouriteModel) =>
          emit(UpdateFavouriteSuccessState(updateFavouriteModel)),
    );
  }
}
