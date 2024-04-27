import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/custom_appbar.dart';

class ProileEditScreen extends StatelessWidget {
  const ProileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        cutomClipper: false,
        widgetsItems: [
          Text("Edit DATA"),
        ],
      ),
      body: Text("Edit Data"),
    );
  }
}
