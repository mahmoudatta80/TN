import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';

abstract class UseCaseWithNoParam<Type>{
  Future<Either<Failure, Type>> call();
}