import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/custom_appbar.dart';
import 'package:uicons/uicons.dart';

class CustomSPappBar extends StatelessWidget {
  const CustomSPappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 8, 15, 56),
      ),
      cutomClipper: true,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      appBarHeight: 270,
      widgetsItems: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 10,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                ),
                                children: [
                                  TextSpan(
                                    text: "Good Morning, ",
                                  ),
                                  TextSpan(
                                    text: "User",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 2,
                          ),
                          child: Text(
                            "Where Are You Going?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => {},
                    icon: Icon(
                      UIcons.regularRounded.bell,
                      color: Colors.white,
                      size: 20,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
