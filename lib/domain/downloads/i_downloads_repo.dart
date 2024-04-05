import 'package:dartz/dartz.dart';
import 'package:netflix/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/models.dart/downloads.dart';

abstract class IdownloadRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadImages();
}
