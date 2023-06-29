import 'package:dartz/dartz.dart';

import '../failures/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
