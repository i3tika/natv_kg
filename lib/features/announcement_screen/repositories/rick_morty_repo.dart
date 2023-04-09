import 'package:dio/dio.dart';

import '../models/rick_morte_models.dart';

class RickMortyRepo {
  final Dio dio;
  RickMortyRepo({required this.dio});
  Future<RickandMortyModel> getRickMorte() async {
    final response =
        await dio.get('https://rickandmortyapi.com/api/character/');
    return RickandMortyModel.fromJson(response.data);
  }
}
