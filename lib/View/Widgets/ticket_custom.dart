import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/doted_line.dart';
import 'package:uicons/uicons.dart';

class TicketCustom extends StatelessWidget {
  const TicketCustom(
      {super.key, required this.isExpired, required this.serialNumber});
  final bool isExpired;
  final int serialNumber;
  @override
  Widget build(BuildContext context) {
    Color detailsColor = Colors.black26;
    bool isExpired = false;
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 17,
        bottom: 17,
      ),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: const Color.fromARGB(193, 209, 205, 205),
            width: 1.0,
          )),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(84, 89, 238, 116),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            UIcons.regularRounded.bus,
                            size: 20,
                            color: const Color.fromARGB(255, 25, 134, 29),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            isExpired ? "Expired" : "Active",
                            style: const TextStyle(
                              color: const Color.fromARGB(255, 25, 134, 29),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    right: 15,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "400",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "EGP",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(UIcons.regularRounded.marker),
                    const Text(
                      "From",
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 105, 122),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Text(
                      "Kanatra",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Text(
                      "4:00",
                      style: TextStyle(
                        color: Color.fromARGB(255, 138, 144, 168),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 30,
                          right: 10,
                        ),
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: const Text(
                          "2h",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 22,
                        ),
                        child: HorizontalLineWithCircle(
                          lineWidth: 2,
                          lineColor: Colors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 20,
                          right: 10,
                        ),
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: const Text(
                          "June 16, 2024",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(UIcons.regularRounded.marker),
                    const Text(
                      "To",
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 105, 122),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Text(
                      "Ismalia",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Text(
                      "2:00",
                      style: TextStyle(
                        color: Color.fromARGB(255, 138, 144, 168),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Icon(UIcons.regularRounded.chair_office),
                const SizedBox(
                  width: 5,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "C1",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      "Seat",
                      style: TextStyle(
                        color: Color.fromARGB(255, 138, 144, 168),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: EdgeInsets.only(
                        right: 5,
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(105, 146, 185, 181),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            UIcons.regularRounded.arrows_repeat,
                            size: 20,
                            color: const Color.fromARGB(255, 105, 138, 135),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            isExpired ? "One Way" : "RoundTrip",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 105, 138, 135),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(105, 146, 185, 181),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            UIcons.regularRounded.fingerprint,
                            size: 20,
                            color: const Color.fromARGB(255, 105, 138, 135),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "SN:${serialNumber}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 105, 138, 135),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
