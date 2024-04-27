import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/custom_2appbar.dart';
import 'package:sinaapp/View/Widgets/setting_custom.dart';
import 'package:sinaapp/View/Widgets/settings_list.dart';
import 'package:uicons/uicons.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
              padding: const EdgeInsets.only(
                top: 100,
                bottom: 130,
              ),
              children: [
                const SizedBox(
                  height: 30,
                ),
                SettingsList(
                  labeltxt: "Trips & Managment",
                  settingsList: [
                    CustomSetting(
                      iconData: UIcons.regularRounded.car_bus,
                      settingTxt: "Trips",
                      onTap: () {
                        Navigator.pushNamed(context, "TripsScreen");
                      },
                    ),
                    CustomSetting(
                      iconData: UIcons.regularRounded.add,
                      settingTxt: "Add Trips",
                      onTap: () {
                        Navigator.pushNamed(context, "AddTripScreen");
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SettingsList(
                  labeltxt: "User Management",
                  settingsList: [
                    CustomSetting(
                      iconData: UIcons.regularRounded.users,
                      settingTxt: "Students",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ]),
          CustomSecoundAppBar(
            iconData: UIcons.regularRounded.apps_add,
            labelText: "Dasboard",
            subTxt: "Sinai Bus App Dashboard",
          ),
        ],
      ),
    );
  }
}
