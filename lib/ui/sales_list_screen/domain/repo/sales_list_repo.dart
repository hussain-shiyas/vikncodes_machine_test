import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';

abstract class SalesListRepo{
  Future<Either<FailureException,SalesListResModel>> getSalesListRepo();
}