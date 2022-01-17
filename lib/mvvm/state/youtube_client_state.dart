import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:training/mvvm/model/youtube_information.dart';

part 'youtube_client_state.freezed.dart';

@freezed
class YoutubeClientState with _$YoutubeClientState {
  const factory YoutubeClientState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<YoutubeInformation>[])
        List<YoutubeInformation> youtubeInformation,
  }) = _YoutubeClientState;
}
