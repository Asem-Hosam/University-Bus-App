import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class CustomModelSheet extends StatelessWidget {
  const CustomModelSheet({
    super.key,
    this.lineColor = const Color.fromARGB(116, 84, 100, 156),
    required this.sheetItems,
    this.cancelBtn = true,
    this.height = double.infinity,
  });

  final List<Widget> sheetItems;
  final double height;
  final bool? cancelBtn;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return cancelBtn!
        ? Container(
            height: height,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.2,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 3,
                          bottom: 20,
                        ),
                        height: 3,
                        decoration: BoxDecoration(
                          color: lineColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () => {
                                  Navigator.pop(context),
                                },
                            icon: Icon(
                              UIcons.regularRounded.cross_circle,
                              size: 21,
                              color: const Color.fromARGB(116, 84, 100, 156),
                            )),
                      ],
                    ),
                  ],
                ),
                ...sheetItems
              ],
            ),
          )
        : Container(
            height: height,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 20,
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.2,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 5,
                          bottom: 20,
                        ),
                        height: 3,
                        decoration: BoxDecoration(
                          color: lineColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ],
                ),
                ...sheetItems
              ],
            ),
          );
  }
}
