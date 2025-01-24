import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/models/profile_res_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState{
  const factory ProfileState.initial()= Initial;
  const factory ProfileState.loading()= Loading;
  const factory ProfileState.success(ProfileResModel profileSuccess)= ProfileSuccess;
  const factory ProfileState.failure(String message)= ProfileFailure;
}