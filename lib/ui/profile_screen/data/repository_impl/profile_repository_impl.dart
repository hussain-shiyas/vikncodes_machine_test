import 'package:dartz/dartz.dart';

import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/data/datasource/profile_datasource.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/models/profile_res_model.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/repository/profile_repository.dart';



class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureException, ProfileResModel>> getProfileRepo() {
    return dataSource.getProfileDatasource();
  }


} 