import 'package:training/mvvm/model/mercari_information.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'mercari_api_client.g.dart';

@RestApi(baseUrl: "https://json-hosting-b39d4.web.app/api/v1")
abstract class MercariApiClient {
  factory MercariApiClient(Dio dio, {String baseUrl}) = _MercariApiClient;

  static MercariApiClient create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return MercariApiClient(dio);
  }

  @GET("/mercari/index.json")
  Future<List<MercariInformation>> fetchMercariInformations();
}
