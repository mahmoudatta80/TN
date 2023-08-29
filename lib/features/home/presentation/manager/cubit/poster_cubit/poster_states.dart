import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';

abstract class PosterStates{}

class PosterInitial extends PosterStates{}

class FetchPostersLoading extends PosterStates{}

class FetchPostersSuccess extends PosterStates{
  final List<PosterEntity> posters;

  FetchPostersSuccess(this.posters);
}

class FetchPostersFailure extends PosterStates{
  final String errorMessage;

  FetchPostersFailure(this.errorMessage);
}