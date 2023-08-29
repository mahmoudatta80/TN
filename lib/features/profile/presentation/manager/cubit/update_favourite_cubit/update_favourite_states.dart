import 'package:shopping_app/features/profile/data/models/update_favourite_model/update_favourite_model.dart';

abstract class UpdateFavouriteStates{}

class UpdateFavouriteInitialState extends UpdateFavouriteStates{}

class UpdateFavouriteSuccessState extends UpdateFavouriteStates{
  final UpdateFavouriteModel updateFavouriteModel;

  UpdateFavouriteSuccessState(this.updateFavouriteModel);
}

class UpdateFavouriteFailureState extends UpdateFavouriteStates{
  final String errorMessage;

  UpdateFavouriteFailureState(this.errorMessage);
}