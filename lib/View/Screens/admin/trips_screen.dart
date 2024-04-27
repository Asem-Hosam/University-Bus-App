import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/custom_2appbar.dart';
import 'package:uicons/uicons.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ListView(
          children: [],
        ),
        CustomSecoundAppBar(
          iconData: UIcons.regularRounded.user,
          labelText: "Trips",
          subTxt: "Manage Uni Trips",
        )
      ]),
    );
  }
}
