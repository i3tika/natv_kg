import 'package:flutter/material.dart';
import 'package:natv_kg/features/admin_panel/models/send_data_model.dart';

@immutable
abstract class SaveChannelEvent {}

class GetChannelEvent extends SaveChannelEvent {}

class SendPostEvent extends SaveChannelEvent {
  final SendDataModel model;
  final Discounts model2;
  final Price model3;

  SendPostEvent(
      {required this.model, required this.model2, required this.model3});
}
