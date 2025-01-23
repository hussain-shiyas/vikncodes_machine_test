import 'package:dartz/dartz.dart';
import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:vikncodes_machine_test/ui/login_screen/data/datasource/login_page_datasource.dart';
import 'package:vikncodes_machine_test/ui/login_screen/domain/model/login_page_res_model.dart';
import 'package:vikncodes_machine_test/ui/login_screen/domain/repository/login_page_repo.dart';

class LoginPageRepoImpl implements LoginPageRepo{
  final LoginPageDatasource dataSource;
  LoginPageRepoImpl(this.dataSource);

  @override
  Future<Either<FailureException, LoginResModel>> getLoginPageRepo(String username, String password) {
    return dataSource.getLoginPageDatasource(username,password);
  }

}