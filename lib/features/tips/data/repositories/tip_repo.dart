import 'package:dartz/dartz.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_general.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_response.dart';

// ignore: one_member_abstracts
abstract class TipRepo {
  Future<Either<TipResponse, Exception>> fetchTips({required int page, required int perPage});

  Future<Either<TipGeneral, Exception>> fetchTipById({required String tipId});
}
