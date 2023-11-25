import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/theme/styles.dart';

class ChatContainer extends StatelessWidget {
  final String title;
  final bool isSender;

  ChatContainer({Key? key, required this.title, required this.isSender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 18.0, left: isSender ? 70 : 0, right: isSender ? 0 : 70),
      child: Container(
        decoration: BoxDecoration(
            color: isSender
                ? AppColors.blue.shade400.withOpacity(0.6)
                : AppColors.grey.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Adaptive.w(50),
                child: Text(
                  title,
                  style: isSender ? veryTinyWhiteStyle : veryTinyStyle,
                ),
              ),
              Text(
                "10:01",
                style: isSender ? veryTinyWhiteStyle : veryTinyStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
