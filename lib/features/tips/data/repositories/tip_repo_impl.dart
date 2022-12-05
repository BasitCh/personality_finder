import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_general.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_response.dart';
import 'package:morphosis_template/features/tips/data/repositories/tip_repo.dart';
import 'package:morphosis_template/features/tips/services/tip_service.dart';

@LazySingleton(as: TipRepo)
class TipRepository extends TipRepo {
  TipService tipService;

  TipRepository(this.tipService);

  @override
  Future<Either<TipResponse, Exception>> fetchTips(
          {required int page, required int perPage}) =>
      tipService.fetchTips(page: page, perPage: perPage);

  @override
  Future<Either<TipGeneral, Exception>> fetchTipById({required String tipId}) =>
      tipService.fetchTipById(tipId: tipId);
}
