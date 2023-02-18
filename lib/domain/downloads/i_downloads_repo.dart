//* what are the api calls will come will write here
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloadRepo {
  //* in either left is failure and right is success
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage();
}
