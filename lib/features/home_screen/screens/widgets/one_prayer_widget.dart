import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnePrayerWidget extends StatelessWidget {
  final String icon, name, time;
  const OnePrayerWidget({
    super.key,
    required this.icon,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SvgPicture.asset(icon),
        Text(name, style: Theme.of(context).textTheme.titleSmall),
        Text(time, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
