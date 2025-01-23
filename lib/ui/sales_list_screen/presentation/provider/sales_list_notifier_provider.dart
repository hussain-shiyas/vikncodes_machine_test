import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/provider/sales_list_domain_provider.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/provider/notifier/sales_list_notifier.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/state/sales_list_state.dart';

final salesListNotifierProvider=StateNotifierProvider<SalesListNotifier,SalesListState>((ref){
  final repo=ref.read(salesListRepositoryProvider);
  return SalesListNotifier(repo);
});