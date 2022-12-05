import 'package:dartz/dartz.dart';
import 'package:morphosis_template/features/token_refresh/domain/entities/refresh_data.dart';

// ignore: one_member_abstracts
abstract class TokenService {
  Future<Either<RefreshData, Exception>> tokenRefresh();
}
