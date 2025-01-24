import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/core/local_storage/hive.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/repo/sales_list_repo.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/state/sales_list_state.dart';

class SalesListNotifier extends StateNotifier<SalesListState>{
  final SalesListRepo repo;
  SalesListNotifier(this.repo) : super(const Initial());

  Future<void> getSalesListResData() async{
    state = const SalesListState.loading();
    try {
      var data = await repo.getSalesListRepo();
      state = data.fold(((failure) {
        return SalesListState.failure(failure.message);
      }), (success) {
         StorageServiceMixin().addData<SalesListResModel>(MainBoxKeys.salesList,success);
        return SalesListState.success(success);
      });
    } catch (e) {
      state = const SalesListState.failure('failure.message');
    }
  }

  Future<void> searchSalesData(String search) async {
    state = const SalesListState.loading();
    try {
      SalesListResModel salesData = StorageServiceMixin().getData<SalesListResModel>(MainBoxKeys.salesList);
      
      if (search.trim().isEmpty) {
        // If search is empty, return all data
        state = SalesListState.success(salesData);
        return;
      }

      // Filter data based on search string
      List<SalesData> filteredData = salesData.data?.where((sale) {
        // Convert both strings to lowercase for case-insensitive search
        final customerName = sale.customerName?.toLowerCase() ?? '';
        final searchTerm = search.toLowerCase();
        return customerName.contains(searchTerm);
      }).toList() ?? [];

      // Create new SalesListResModel with filtered data
      SalesListResModel filteredModel = SalesListResModel(
        statusCode: salesData.statusCode,
        data: filteredData,
        totalCount: filteredData.length,
      );

      state = SalesListState.success(filteredModel);
    } catch (e) {
      state = const SalesListState.failure('Error searching sales data');
    }
  }
}