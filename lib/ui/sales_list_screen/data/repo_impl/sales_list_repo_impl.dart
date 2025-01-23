import 'package:dartz/dartz.dart';
import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/data/datasource/sales_list_datasource.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/repo/sales_list_repo.dart';

class SalesListRepoImpl implements SalesListRepo {
  final SalesListDatasource datasource;

  SalesListRepoImpl(this.datasource);


  @override
  Future<Either<FailureException, SalesListResModel>> getSalesListRepo() {
    return datasource.getSalesListRepo();
  }


}
