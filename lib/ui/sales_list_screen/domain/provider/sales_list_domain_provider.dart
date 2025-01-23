import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/core/services/network_service/network_services.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/data/datasource/sales_list_datasource.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/data/repo_impl/sales_list_repo_impl.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/repo/sales_list_repo.dart';


final networkServiceProvider = Provider((ref)=>NetworkService());

final salesListDatasourceProvider=Provider<SalesListDatasource>((ref){
final networkService = ref.watch(networkServiceProvider);
  return SalesListDatasourceImpl(networkService: networkService);
});

final salesListRepositoryProvider=Provider<SalesListRepo>((ref){
  final datasource=ref.watch(salesListDatasourceProvider);
  return SalesListRepoImpl(datasource);
});