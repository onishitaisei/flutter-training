import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/mvvm/api/qiita_api_client.dart';
import 'package:training/mvvm/model/qiita_item.dart';

final qiitaRepositoryProvider =
    Provider<QiitaRepository>((_) => QiitaRepository());

class QiitaRepository {
  final QiitaApiClient _api = QiitaApiClient.create();

  Future<List<QiitaItem>> fetchQiitaItems(String tag) async {
    return _api.fetchQiitaItems(tag);
  }
}
