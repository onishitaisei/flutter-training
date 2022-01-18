import 'package:training/mvvm/api/youtube_api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/mvvm/model/youtube_information.dart';

final youtubeRepositoryProvider =
    Provider<YoutubeRepository>((_) => YoutubeRepository());

class YoutubeRepository {
  final YoutubeApiClient _api = YoutubeApiClient.create();

  Future<List<YoutubeInformation>> fetchYoutubeInformation() async {
    return _api.fetchYoutubeInformation();
  }
}
