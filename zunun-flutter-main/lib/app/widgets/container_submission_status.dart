import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/expandable_text.dart';
import 'package:zunun/utils/theme/styles.dart';

class SubmissionStatusContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  const SubmissionStatusContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.color})
      : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Adaptive.w(44),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
            child: Text(title, style: veryTinyBoldStyle),
          ),
        ),
        Container(
          width: Adaptive.w(44),
          decoration: BoxDecoration(color: color),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
            child: ExpandbleText(text: subtitle)
            // Text(subtitle, style: veryTinyStyle,maxLines: 5,),
          ),
        ),
      ],
    );
  }
}
