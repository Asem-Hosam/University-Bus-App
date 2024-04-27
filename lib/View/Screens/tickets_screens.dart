import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/custom_2appbar.dart';
import 'package:sinaapp/View/Widgets/ticket_custom.dart';
import 'package:uicons/uicons.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(
              top: 120,
              bottom: 105,
            ),
            children: const [
              TicketCustom(
                isExpired: true,
                serialNumber: 15546846894837,
              ),
              TicketCustom(
                isExpired: false,
                serialNumber: 15546846894836,
              ),
              TicketCustom(
                isExpired: false,
                serialNumber: 15546846894836,
              ),
              TicketCustom(
                isExpired: false,
                serialNumber: 15546846894836,
              ),
            ],
          ),
          CustomSecoundAppBar(
            iconData: UIcons.regularRounded.ticket,
            labelText: "Tickets",
            subTxt: "Explore Your Tickets",
          )
        ],
      ),
    );
  }
}
