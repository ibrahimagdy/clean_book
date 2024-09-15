import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

abstract class UseCase<T,Param>{
  Future<Either<Failures,T>> call([Param param]);

}
class NoParam{}
