import 'package:dio_client/dio_client.dart';

class ApiBase {
  static final dioClient = DioClient(baseUrl: 'http://10.0.2.2/todoapi/');
}
