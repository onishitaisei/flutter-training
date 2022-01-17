import 'package:training/mvvm/repository/mercari_repository.dart';
import 'package:training/mvvm/state/mercari_client_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mercariClientStateNotifier = StateNotifierProvider.autoDispose<
    MercariClientStateNotifier,
    MercariClientState>((ref) => MercariClientStateNotifier(ref.read));

class MercariClientStateNotifier extends StateNotifier<MercariClientState> {
  MercariClientStateNotifier(this._read) : super(const MercariClientState()) {
    fetchMercariInformations();
  }

  final Reader _read;

  Future<void> fetchMercariInformations() async {
    state = state.copyWith(isLoading: true);

    final mercariInformations =
        await _read(mercariRepositoryProvider).fetchMercariInformations();

    if (mercariInformations.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        mercariInformations: mercariInformations,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        mercariInformations: [],
      );
    }
  }
}
