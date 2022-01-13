import 'package:freezed_annotation/freezed_annotation.dart';

part 'qiita_user.freezed.dart';
part 'qiita_user.g.dart';

@freezed
class QiitaUser with _$QiitaUser {
  const factory QiitaUser({
    @JsonKey(name: "profile_image_url") String? profileImageUrl,
  }) = _QiitaUser;

  factory QiitaUser.fromJson(Map<String, dynamic> json) =>
      _$QiitaUserFromJson(json);
}
