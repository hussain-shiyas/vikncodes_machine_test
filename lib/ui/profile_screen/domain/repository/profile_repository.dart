import 'package:dartz/dartz.dart';
import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/models/profile_res_model.dart';


abstract class ProfileRepository {
  Future<Either<FailureException, ProfileResModel>> getProfileRepo();
} 