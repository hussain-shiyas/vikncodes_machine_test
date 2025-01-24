import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/core/local_storage/hive.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/repository/profile_repository.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/presentation/state/profile_state.dart';

class ProfilePageNotifier extends StateNotifier<ProfileState>
    with StorageServiceMixin {
  final ProfileRepository repo;

  ProfilePageNotifier(this.repo) : super(const Initial());

  Future<void> getProfileResData() async {
    state = const ProfileState.loading();
    try {
      var data = await repo.getProfileRepo();
      state = data.fold(((failure) {
        return ProfileState.failure(failure.message);
      }), (success) {
        // StorageServiceMixin()
        //     .addData<String>(MainBoxKeys.token, success.data?.access ?? "");
        return ProfileSuccess(success);
      });
    } catch (e) {
      state = const ProfileState.failure("failure");
    }
  }
}
