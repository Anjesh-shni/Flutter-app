import 'package:flutter/material.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/theme/styles.dart';

class NotesTile extends StatelessWidget {
  const NotesTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.grey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                style: veryTinyStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Feb 8",
                    style: veryTinyGreyStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
