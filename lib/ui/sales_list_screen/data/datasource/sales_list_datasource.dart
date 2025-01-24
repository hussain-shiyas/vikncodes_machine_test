import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:vikncodes_machine_test/core/endpoints/endpoints.dart';
import 'package:vikncodes_machine_test/core/local_storage/hive.dart';
import 'package:vikncodes_machine_test/core/model/failure_exception.dart';
import 'package:vikncodes_machine_test/core/services/network_service/network_services.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sale_list_req_model.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';

abstract class SalesListDatasource {
  Future<Either<FailureException, SalesListResModel>> getSalesListRepo();
}

class SalesListDatasourceImpl implements SalesListDatasource {
  final NetworkService networkService;

  SalesListDatasourceImpl({required this.networkService});

  @override
  Future<Either<FailureException, SalesListResModel>> getSalesListRepo() async {
    try {
      String userId = StorageServiceMixin().getData<String>(MainBoxKeys.userId);
      int id = int.parse(userId);
      SaleListRequest body = SaleListRequest(
        branchId: 1,
        companyId: "1901b825-fe6f-418d-b5f0-7223d0040d08",
        createdUserId: id,
        itemsPerPage: 20,
        pageNo: 1,
        priceRounding: 2,
        type: "Sales",
        warehouseId: 1,
      );
      final data = await networkService.post(EndPoints.getSalesList,
          body: body.toJson());
      return Right(SalesListResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException(
        e.toString(),
        '500',
      ));
    }
  }
}
