import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/custom_appbar.dart';

class CustomSecoundAppBar extends StatelessWidget {
  const CustomSecoundAppBar({
    super.key,
    required this.iconData,
    required this.labelText,
    required this.subTxt,
    this.isleading = false,
  });

  final IconData iconData;
  final String labelText;
  final String subTxt;
  final bool isleading;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        cutomClipper: true,
        appBarHeight: 125,
        decoration: const BoxDecoration(
          color: const Color.fromARGB(244, 8, 15, 56),
        ),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        widgetsItems: [
          Padding(
              padding: const EdgeInsets.only(
                left: 22,
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Icon(
                      iconData,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labelText,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          subTxt,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ]);
  }
}
