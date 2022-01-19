import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/mvvm/repository/qiita_repository.dart';
import 'package:training/mvvm/state/qiita_client_state.dart';

final qiitaClientStateNotifier = StateNotifierProvider.autoDispose<
    QiitaClientStateNotifier,
    QiitaClientState>((ref) => QiitaClientStateNotifier(ref.read));

class QiitaClientStateNotifier extends StateNotifier<QiitaClientState> {
  QiitaClientStateNotifier(this._read)
      : super(const QiitaClientState()); //親クラスQiitaClientStateクラスを継承

  final Reader _read;

  Future<void> fetchQiitaItems(String tag) async {
    state = state.copyWith(isLoading: true);

    final qiitaItems =
        await _read(qiitaRepositoryProvider).fetchQiitaItems(tag);

    if (qiitaItems.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        isReadyData: true,
        currentTag: tag,
        qiitaItems: qiitaItems,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        isReadyData: false,
        qiitaItems: qiitaItems,
      );
    }
  }

  void onBackHome() {
    state = state.copyWith(
      isLoading: false,
      isReadyData: false,
      currentTag: '',
    );
  }
}
