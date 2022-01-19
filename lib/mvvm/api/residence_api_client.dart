import 'package:training/mvvm/model/residence_information.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'residence_api_client.g.dart';

@RestApi(baseUrl: "https://json-hosting-b39d4.web.app/api/v1")
abstract class ResidenceApiClient {
  factory ResidenceApiClient(Dio dio, {String baseUrl}) = _ResidenceApiClient;

  static ResidenceApiClient create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ResidenceApiClient(dio);
  }

  @GET("/residence/index.json")
  Future<List<ResidenceInformation>> fetchResidenceInformations();
}
