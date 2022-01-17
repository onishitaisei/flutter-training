import 'package:training/mvvm/model/mercari_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mercari_client_state.freezed.dart';

@freezed
class MercariClientState with _$MercariClientState {
  const factory MercariClientState({
    @Default(false) bool isLoading,
    @Default(<MercariInformation>[])
        List<MercariInformation> mercariInformations,
  }) = _MercariClientState;
}
