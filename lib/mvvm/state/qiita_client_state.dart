import 'package:training/mvvm/model/qiita_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qiita_client_state.freezed.dart';

@freezed
class QiitaClientState with _$QiitaClientState {
// 変更を画面に通知したい変数を集約
  const factory QiitaClientState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<QiitaItem>[]) List<QiitaItem> qiitaItems,
    @Default('') String currentTag,
  }) = _QiitaClientState;
}
