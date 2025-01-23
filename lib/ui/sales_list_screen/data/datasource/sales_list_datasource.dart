import 'package:dartz/dartz.dart';
import 'package:vikncodes_machine_test/core/endpoints/endpoints.dart';
import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:vikncodes_machine_test/core/services/network_service/network_services.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';

abstract class SalesListDatasource{
  Future<Either<FailureException,SalesListResModel>> getSalesListRepo();
}

class SalesListDatasourceImpl implements SalesListDatasource{
  final NetworkService networkService;

  SalesListDatasourceImpl({required this.networkService});
  @override
  Future<Either<FailureException, SalesListResModel>> getSalesListRepo() async{
    try {
      final data = await networkService.get(EndPoints.getSalesList);
      return Right(SalesListResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException(
        'Failed to fetch data from the server',
        '500',
      ));
    }
  }

}