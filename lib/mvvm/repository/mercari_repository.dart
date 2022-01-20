import 'package:training/mvvm/api/mercari_api_client.dart';
import 'package:training/mvvm/model/mercari_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mercariRepositoryProvider =
    Provider<MercariRepository>((_) => MercariRepository());

class MercariRepository {
  final MercariApiClient _api = MercariApiClient.create();

  Future<List<MercariInformation>> fetchMercariInformations() async {
    return _api.fetchMercariInformations();
  }
}
