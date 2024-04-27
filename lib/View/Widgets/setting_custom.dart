import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class CustomSetting extends StatelessWidget {
  const CustomSetting({
    super.key,
    this.onTap,
    required this.settingTxt,
    this.iconData,
    this.subtitle,
  });

  final void Function()? onTap;
  final String settingTxt;
  final IconData? iconData;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: ListTile(
        trailing: Icon(
          UIcons.regularRounded.angle_small_right,
          size: 19,
        ),
        horizontalTitleGap: 0.2,
        onTap: onTap,
        subtitle: subtitle,
        title: Text(
          settingTxt,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
        leading: Icon(
          iconData,
          size: 22,
          color: Colors.black,
        ),
      ),
    );
  }
}
