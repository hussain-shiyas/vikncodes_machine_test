import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/core/services/network_service/network_services.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/data/datasource/profile_datasource.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/data/repository_impl/profile_repository_impl.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/repository/profile_repository.dart';




final networkServiceProvider = Provider((ref) => NetworkService());

final datasourceProvider=Provider<ProfileDataSource>((ref){
  final networkService = ref.watch(networkServiceProvider);
  return ProfileDataSourceImpl(networkService: networkService);
});
final profileRepositoryProvider=Provider<ProfileRepository>((ref){
  final dataSource=ref.watch(datasourceProvider);
  return ProfileRepositoryImpl(dataSource);
});


