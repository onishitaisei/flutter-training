import 'package:training/mvvm/model/residence_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'residence_client_state.freezed.dart';

@freezed
class ResidenceClientState with _$ResidenceClientState {
  const factory ResidenceClientState({
    @Default(false) bool isLoading,
    @Default(<ResidenceInformation>[])
        List<ResidenceInformation> residenceInformations,
  }) = _ResidenceClientState;
}
