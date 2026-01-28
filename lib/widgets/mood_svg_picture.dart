import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoodSvgPicture extends StatelessWidget {
  final String moodIconAssetString;
  const MoodSvgPicture({super.key, required this.moodIconAssetString});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(moodIconAssetString, width: 48, height: 48);
  }
}
