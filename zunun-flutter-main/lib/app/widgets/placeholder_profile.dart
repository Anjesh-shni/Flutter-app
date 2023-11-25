import 'package:flutter/material.dart';
import 'package:zunun/utils/constants/dimension.dart';

class ProfilePlaceholder extends StatelessWidget {
  const ProfilePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage(AppImages.profilePic),
    );
  }
}
