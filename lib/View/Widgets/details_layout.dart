import 'package:flutter/material.dart';

class Detailslayout extends StatelessWidget {
  const Detailslayout(
      {super.key, required this.userName, required this.userEmail});

  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
        color: const Color.fromARGB(255, 228, 232, 238),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
            width: 65,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 94, 116, 117),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                userEmail,
                style: const TextStyle(
                  color: Color.fromARGB(255, 144, 144, 144),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
