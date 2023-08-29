import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';

abstract class UseCaseWithParam<Type, Param>{
  Future<Either<Failure, Type>> call(Param param);
}