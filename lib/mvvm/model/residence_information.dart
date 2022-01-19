import 'package:freezed_annotation/freezed_annotation.dart';

part 'residence_information.freezed.dart';
part 'residence_information.g.dart';

@freezed
class ResidenceInformation with _$ResidenceInformation {
  const factory ResidenceInformation({
    String? layoutImagePath,
    String? title,
    String? accessInfo,
    String? roomInfo,
    String? oldnessInfo,
    int? price,
  }) = _ResidenceInformation;

  factory ResidenceInformation.fromJson(Map<String, dynamic> json) =>
      _$ResidenceInformationFromJson(json);
}
