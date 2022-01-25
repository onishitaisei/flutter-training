import 'package:freezed_annotation/freezed_annotation.dart';

part 'mercari_information.freezed.dart';
part 'mercari_information.g.dart';

@freezed
class MercariInformation with _$MercariInformation {
  const factory MercariInformation({
    String? imagePath,
    String? title,
    int? price,
    int? numOfPeople,
  }) = _MercariInformation;

  factory MercariInformation.fromJson(Map<String, dynamic> json) =>
      _$MercariInformationFromJson(json);
}
