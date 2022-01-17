import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_information.freezed.dart';
part 'youtube_information.g.dart';

@freezed
class YoutubeInformation with _$YoutubeInformation {
  const factory YoutubeInformation({
    String? imagePath,
    String? iconPath,
    String? title,
    String? channelName,
    int? numOfViews,
    int? daysAgo,
  }) = _YoutubeInformation;

  factory YoutubeInformation.fromJson(Map<String, dynamic> json) =>
      _$YoutubeInformationFromJson(json);
}
