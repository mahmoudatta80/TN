import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_posters_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/poster_cubit/poster_states.dart';

class PosterCubit extends Cubit<PosterStates> {
  final FetchPostersUseCase fetchPostersUseCase;

  PosterCubit(this.fetchPostersUseCase) : super(PosterInitial());

  Future fetchPosters() async {
    emit(FetchPostersLoading());

    Either<Failure, List<PosterEntity>> result =
        await fetchPostersUseCase.call();

    if(isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(FetchPostersFailure(failure.message)),
      (posterEntity) => emit(FetchPostersSuccess(posterEntity)),
    );
  }
}
