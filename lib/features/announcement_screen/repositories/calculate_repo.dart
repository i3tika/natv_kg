import 'package:dio/dio.dart';

import '../models/calculate_models.dart';

class CalculateRepo {
  final Dio dio;
  CalculateRepo({required this.dio});

  Future<CalculateModels> calculateRepositories({
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
      }
    );
    return CalculateModels.fromJson(response.data);
  }
}
