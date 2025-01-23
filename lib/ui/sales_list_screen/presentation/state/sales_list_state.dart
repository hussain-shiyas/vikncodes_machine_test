import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';

part 'sales_list_state.freezed.dart';

@freezed
class SalesListState with _$SalesListState{
  const factory SalesListState.initial()= Initial;
  const factory SalesListState.loading()= Loading;
  const factory SalesListState.success(SalesListResModel salesListPageSuccess)= SalesListPageSuccess;
  const factory SalesListState.failure(String message)= SalesListPageFailure;
}