import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:training/mvvm/model/qiita_item.dart';

part 'qiita_client_state.freezed.dart';

@freezed
class QiitaClientState with _$QiitaClientState {
  const factory QiitaClientState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<QiitaItem>[]) List<QiitaItem> qiitaItems,
    @Default('') String currentTag,
  }) = _QiitaClientState;
}
