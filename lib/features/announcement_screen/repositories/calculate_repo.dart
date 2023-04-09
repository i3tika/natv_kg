import 'package:dio/dio.dart';

class CalculateRepo {
  final Dio dio;
  CalculateRepo({required this.dio});

  Future calculateRepositories({
    required String text,
    required int daysCount,
    required int channelId,
  }) async {
    final response = await dio.get(
        'https://app1.megacom.kg:9090/test_task/api/v1/channel/calculate',
        data: {
          'daysCount': daysCount,
          'text': text,
          'channelId': channelId,
        });
  }
}
