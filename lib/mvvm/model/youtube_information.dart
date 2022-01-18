import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_information.freezed.dart';
part 'youtube_information.g.dart';

@freezed
class YoutubeInformation with _$YoutubeInformation {
  const factory YoutubeInformation({
    @Default('') String imagePath,
    @Default('') String iconPath,
    @Default('') String title,
    @Default('') String channelName,
    @Default(0) int numOfViews,
    @Default(0) int daysAgo,
  }) = _YoutubeInformation;

  factory YoutubeInformation.fromJson(Map<String, dynamic> json) =>
      _$YoutubeInformationFromJson(json);
}
