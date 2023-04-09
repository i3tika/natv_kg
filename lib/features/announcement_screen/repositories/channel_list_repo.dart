import 'package:dio/dio.dart';

import '../models/channel_list_models.dart';
import '../models/channels.dart';
import '../models/rick_morte_models.dart';

class GetChanelListRepo {
  final Dio dio;
  GetChanelListRepo({required this.dio});

  Future<List<Channel>> fetchChannelList() async {
    final response = await dio.get(
      '/api/v1/channel/list',
    );
    final List<Channel> result = [];

    for (var item in response.data as List) {
      try {
        result.add(Channel.fromJson(item));
      } catch (e) {}
    }

    return result;
  }
}
