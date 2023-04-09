import 'package:dio/dio.dart';

import '../models/channel_list_models.dart';
import '../models/rick_morte_models.dart';

class GetChanelListRepo {
  final Dio dio;
  GetChanelListRepo({required this.dio});

  Future<List<ChanelListModel>> fetchChannelList() async {
    final response = await dio.get(
      'https://app1.megacom.kg:9090/test_task/api/v1/channel/list',
    );
    final List<ChanelListModel> result = [];

    for (var item in response.data as List) {
      try {
        result.add(ChanelListModel.fromJson(item));
      } catch (e) {}
    }

    return result;
  }

  //  Future<RickandMortyModel> getRickMorte() async {
  //   final response = await dio.get('https://rickandmortyapi.com/api/character/');
  //   return RickandMortyModel.fromJson(response.data);
  // }
}
