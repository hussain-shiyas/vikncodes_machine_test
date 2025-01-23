import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/repo/sales_list_repo.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/state/sales_list_state.dart';

class SalesListNotifier extends StateNotifier<SalesListState>{
  final SalesListRepo repo;
  SalesListNotifier(this.repo) : super(const Initial());

  Future<void> getSalesListResData() async{
    state = const SalesListState.initial();
    try {
      var data = await repo.getSalesListRepo();
      state = data.fold(((failure) {
        return SalesListState.failure(failure.message);
      }), (success) {
        return SalesListState.success(success);
      });
    } catch (e) {
      state = const SalesListState.failure('failure.message');
    }
  }
}