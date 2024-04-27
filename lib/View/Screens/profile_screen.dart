import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaapp/Core/cubits/auth_cubit/auth_cubit.dart';
import 'package:sinaapp/View/Widgets/custom_2appbar.dart';
import 'package:sinaapp/View/Widgets/custom_button.dart';
import 'package:sinaapp/View/Widgets/custom_modelsheet.dart';
import 'package:sinaapp/View/Widgets/details_layout.dart';
import 'package:sinaapp/View/Widgets/setting_custom.dart';
import 'package:sinaapp/View/Widgets/settings_list.dart';
import 'package:uicons/uicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(children: [
        ListView(
            padding: const EdgeInsets.only(
              top: 100,
              bottom: 130,
            ),
            children: [
              const SizedBox(
                height: 30,
              ),
              const Detailslayout(userName: "User", userEmail: "userEmail"),
              const SizedBox(
                height: 30,
              ),
              SettingsList(
                labeltxt: "Account & Profile",
                settingsList: [
                  CustomSetting(
                    iconData: UIcons.regularRounded.user,
                    settingTxt: "Profile",
                    onTap: () {
                      Navigator.pushNamed(context, "ProfileEditScreen");
                    },
                  ),
                  CustomSetting(
                    iconData: UIcons.regularRounded.lock,
                    settingTxt: "Privacy & Security",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SettingsList(
                labeltxt: "Personalization",
                settingsList: [
                  CustomSetting(
                    iconData: UIcons.regularRounded.globe,
                    settingTxt: "Langauge",
                    subtitle: const Text(
                      "English",
                    ),
                    onTap: () {},
                  ),
                  CustomSetting(
                    iconData: UIcons.regularRounded.moon_stars,
                    settingTxt: "Theme",
                    subtitle: const Text(
                      "Default",
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SettingsList(
                labeltxt: "Actions",
                settingsList: [
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return CustomSetting(
                        iconData: UIcons.regularRounded.sign_out_alt,
                        settingTxt: "Logout",
                        onTap: () {
                          showModalBottomSheet(
                              isDismissible: true,
                              backgroundColor:
                                  const Color.fromARGB(220, 187, 199, 214),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return CustomModelSheet(
                                  cancelBtn: true,
                                  height: 270,
                                  sheetItems: [
                                    Column(
                                      children: [
                                        const Text(
                                            "Are you sure you want to Logout?",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Poppins",
                                            )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        CustomButton(
                                          bgColor: const Color.fromARGB(
                                              255, 8, 15, 56),
                                          onPressed: () async {
                                            BlocProvider.of<AuthCubit>(context)
                                                .signOut();
                                            Navigator.pushNamed(
                                                context, "Login");
                                          },
                                          btnWidth: double.infinity,
                                          btnText: "Yes",
                                          btnHeight: 50,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        CustomButton(
                                          bgColor: const Color.fromARGB(
                                              255, 228, 232, 238),
                                          onPressed: () => {
                                            Navigator.pop(context),
                                          },
                                          txtColor: Colors.black,
                                          btnWidth: double.infinity,
                                          btnText: "No",
                                          btnHeight: 50,
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ]),
        CustomSecoundAppBar(
          iconData: UIcons.regularRounded.user,
          labelText: "Profile",
          subTxt: "Manage Your Profile",
        )
      ]),
    );
  }
}
