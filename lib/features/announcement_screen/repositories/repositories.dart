import 'package:dio/dio.dart';
import 'package:natv_kg/features/announcement_screen/models/get_calculate.dart';




class CalculateRepo {
  final Dio dio;

  CalculateRepo({required this.dio});

  Future<GetCalculate> getCalculate({required int channel}) async {
    final response = await dio.get(
        'https://app1.megacom.kg:9090/test_task//api/v1/channel/calculate',
        // data: {},
        queryParameters: {
          'channel':channel
        });
    return GetCalculate.fromJson(response.data);
  }
}
