import 'package:dio/dio.dart';
import 'package:natv_kg/features/announcement_screen/models/chanel_list_model.dart';
import 'package:natv_kg/features/announcement_screen/models/get_chanel_id_model.dart';

class GetChanelIdRepo {
  final Dio dio;
  GetChanelIdRepo({required this.dio});

  Future<GetChanelId> getchanelid(int id) async {
    final response = await dio
        .get('https://app1.megacom.kg:9090/test_task/api/v1/channel/$id');
    return GetChanelId.fromJson(response.data);
  }
}
