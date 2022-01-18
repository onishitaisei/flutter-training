import 'package:training/mvvm/repository/youtube_repository.dart';
import 'package:training/mvvm/state/youtube_client_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final youtubeClientStateNotifier = StateNotifierProvider.autoDispose<
    YoutubeClientStateNotifier,
    YoutubeClientState>((ref) => YoutubeClientStateNotifier(ref.read));

class YoutubeClientStateNotifier extends StateNotifier<YoutubeClientState> {
  YoutubeClientStateNotifier(this._read) : super(const YoutubeClientState()) {
    fetchYoutubeInformations(); // youtube画面遷移時に発火
  }

  final Reader _read;

  Future<void> fetchYoutubeInformations() async {
    state = state.copyWith(isLoading: true);

    final youtubeInformations =
        await _read(youtubeRepositoryProvider).fetchYoutubeInformation();

    if (youtubeInformations.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        youtubeInformation: youtubeInformations,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        youtubeInformation: [],
      );
    }
  }
}
