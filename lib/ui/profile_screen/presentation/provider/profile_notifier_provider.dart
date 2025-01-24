import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/domain/provider/profile_domain_provider.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/presentation/provider/notifier/profile_notifier.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/presentation/state/profile_state.dart';


final profileNotifierProvider=StateNotifierProvider<ProfilePageNotifier,ProfileState>((ref){
  final repo =ref.read(profileRepositoryProvider);
  return ProfilePageNotifier(repo);
});