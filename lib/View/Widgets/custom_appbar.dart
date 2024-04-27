import "package:flutter/material.dart";

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    Key? key,
    required this.widgetsItems,
    this.appBarHeight = 50,
    this.decoration,
    required this.cutomClipper,
  }) : super(key: key);

  final List<Widget> widgetsItems;
  final double? appBarHeight;

  final Decoration? decoration;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool cutomClipper;

  @override
  Widget build(BuildContext context) {
    return !cutomClipper
        ? Container(
            height: appBarHeight,
            decoration: decoration,
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: [
                ...widgetsItems,
              ],
            ),
          )
        : ClipPath(
            clipper: CustomAppBarCllip(),
            child: Container(
              height: appBarHeight,
              decoration: decoration,
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  ...widgetsItems,
                ],
              ),
            ),
          );
  }

  @override
  Size get preferredSize => Size(double.infinity, appBarHeight!);
}

class CustomAppBarCllip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
// (0, 0) // 1. Point
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * 0.5, //•3. Point
      h - 50, // •3. • Point
      w, // 4. Point
      h, // 4. Point
    );
    path.lineTo(w, 0); // 5. Point Bezi
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
