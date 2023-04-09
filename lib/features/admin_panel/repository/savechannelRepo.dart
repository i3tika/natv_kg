import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/get_list_channel_model.dart';
import '../models/send_data_model.dart';


class SaveChannelrepo {
  final Dio dio;

  SaveChannelrepo({required this.dio});
  List<GetListChannel> channelDetails = [];
  Future<void> sendData({
    required SendDataModel model,
    required Discounts model2,
    required Price model3,
  }) async {
    final postchannel = await dio.post(
      "/api/v1/channel/save",
      data: {
        "active": model.active,
        //"channelId": model.channelId,
        "channelName": model.channelName,
        "discounts": [
          {
            "discount": model2.discount,
            "fromDaysCount": model2.fromDaysCount,
            "id": model2.id
          }
        ],
        "logoPath": model.logoPath,
        "price": {
          "bannerPrice": model3.bannerPrice,
          "id": model3.id,
          "pricePerLetter": model3.pricePerLetter
        }
      },
    );
  }

  Future<List<GetListChannel>> getChannel() async {
    final channelresponse = await dio.get('/api/v1/channel/list');

    final List<GetListChannel> result = [];
    for (var item in channelresponse.data) {
      try {
        result.add(GetListChannel.fromJson(item));
      } catch (e) {
        const Text('Error');
      }
    }
    return result;
  }
}
