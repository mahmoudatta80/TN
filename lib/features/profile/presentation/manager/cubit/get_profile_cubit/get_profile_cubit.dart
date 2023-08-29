import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/get_profile_cubit/get_profile_states.dart';

class GetProfileCubit extends Cubit<GetProfileStates> {
  final GetProfileUseCase getProfileUseCase;

  GetProfileCubit(this.getProfileUseCase) : super(GetProfileInitialState());

  Future getProfile() async {
    emit(GetProfileLoadingState());

    Either<Failure, UserResponseModel> result = await getProfileUseCase.call();

    if (isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(GetProfileFailureState(failure.message)),
      (userResponseModel) => emit(GetProfileSuccessState(userResponseModel)),
    );
  }
}
