import 'package:training/mvvm/repository/residence_repository.dart';
import 'package:training/mvvm/state/residence_client_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final residenceClientStateNotifier = StateNotifierProvider.autoDispose<
    ResidenceClientStateNotifier,
    ResidenceClientState>((ref) => ResidenceClientStateNotifier(ref.read));

class ResidenceClientStateNotifier extends StateNotifier<ResidenceClientState> {
  ResidenceClientStateNotifier(this._read)
      : super(const ResidenceClientState()) {
    fetchResidenceInformations();
  }

  final Reader _read;

  Future<void> fetchResidenceInformations() async {
    state = state.copyWith(isLoading: true);

    final residenceInformations =
        await _read(residenceRepositoryProvider).fetchResidenceInformations();

    if (residenceInformations.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        residenceInformations: residenceInformations,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        residenceInformations: [],
      );
    }
  }
}
