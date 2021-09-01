import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rx<MessageModel>? message) {
    if (message != null) {
      ever<MessageModel>(message, (model) {
        Get.snackbar(model.title!, model.message!,
            backgroundColor: model.type!.color());
      });
    }
  }
}

class MessageModel {
  final String? title;
  final String? message;
  final MessageType? type;
  MessageModel({
    this.title,
    this.message,
    this.type,
  });
}

enum MessageType { error, info }

extension MessageTypeColorExt on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800] as Color;
      case MessageType.info:
        return Colors.blue[200] as Color;
      default:
        return Colors.black38;
    }
  }
}
