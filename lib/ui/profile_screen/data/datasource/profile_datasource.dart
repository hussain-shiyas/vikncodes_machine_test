import 'package:dartz/dartz.dart';
import 'package:vikncodes_machine_test/core/endpoints/endpoints.dart';
import 'package:vikncodes_machine_test/core/local_storage/hive.dart';
import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:vikncodes_machine_test/core/services/network_service/network_services.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/models/profile_res_model.dart';

abstract class ProfileDataSource {
  Future<Either<FailureException, ProfileResModel>> getProfileDatasource();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final NetworkService networkService;

  ProfileDataSourceImpl({required this.networkService});

  @override
  Future<Either<FailureException, ProfileResModel>> getProfileDatasource() async{
    try {
      String userId = StorageServiceMixin().getData<String>(MainBoxKeys.userId);
      String endpoint=EndPoints.getUserDetails+userId;
      final data = await networkService.get("$endpoint/");
      return Right(ProfileResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException(
        e.toString(),
        '500',
      ));
    }
  }

} 