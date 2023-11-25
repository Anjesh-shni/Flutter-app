import 'package:flutter/material.dart';
import 'package:zunun/utils/theme/styles.dart';

class ProfileStats extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProfileStats({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              title,
              style: tinyBoldStyle,
            ),
            Text(
              subtitle,
              style: tinyGreyStyle,
            )
          ],
        ),
      ),
    );
  }
}
