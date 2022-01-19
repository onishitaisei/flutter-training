import 'package:training/mvvm/api/residence_api_client.dart';
import 'package:training/mvvm/model/residence_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final residenceRepositoryProvider =
    Provider<ResidenceRepository>((_) => ResidenceRepository());

class ResidenceRepository {
  final ResidenceApiClient _api = ResidenceApiClient.create();

  Future<List<ResidenceInformation>> fetchResidenceInformations() async {
    return _api.fetchResidenceInformations();
  }
}
