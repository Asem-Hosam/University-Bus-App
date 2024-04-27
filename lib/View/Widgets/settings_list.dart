import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  const SettingsList(
      {super.key, required this.labeltxt, required this.settingsList});

  final String labeltxt;
  final List<Widget> settingsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 22,
            bottom: 5,
          ),
          child: Text(
            labeltxt,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 19,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(
            color: const Color.fromARGB(255, 228, 232, 238),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              ...settingsList,
            ],
          ),
        ),
      ],
    );
  }
}
