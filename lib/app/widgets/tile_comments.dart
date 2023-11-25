import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/features/presentation/uploadAssignment/assignmentModel/assignment_model.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

import '../../config/extension/dateformater.dart';

class CommentTile extends StatelessWidget {
  final Comments comment;
  CommentTile({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImages.profilePic),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.user!.name.toString(),
                  style: underlineTinyYellowStyle),
              SizedBox(height: Adaptive.h(AppDimens.tinySizedBox)),
              Text(
                convertUtcDateString(comment.createdAt.toString()),
                // "${comment.createdAt.toString()}",
                style: veryTinyGreyStyle,
              ),
              SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
              Text(
                comment.comment.toString(),
                style: veryTinyStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
