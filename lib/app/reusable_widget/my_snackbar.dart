import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zunun/app/widgets/big_text.dart';

void cuastomSnackBAr(
  String messege, {
  bool isError = true,
  String title = "Error",
}) {
  Get.snackbar(
    title,
    messege,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.grey,
    titleText: BigText(
      text: title,
      color: Colors.black,
      size: 16,
    ),
    messageText: Text(
      messege,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
