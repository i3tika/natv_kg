import 'package:dio/dio.dart';
import 'package:natv_kg/features/announcement_screen/models/chanel_list_model.dart';

class GetChanelList {
  final Dio dio;
  GetChanelList({required this.dio});

  // Future getchanellist() async {
  //   final response = await dio
  //       .get('https://app1.megacom.kg:9090/test_task/api/v1/channel/list');
  //   return ChanelListModel.fromJson(response.data);
  // }
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
}
