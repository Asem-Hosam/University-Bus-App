import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uicons/uicons.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    required this.isAdmin,
    super.key,
    this.onTapChanged,
  });
  final bool isAdmin;

  final void Function(int)? onTapChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(244, 8, 15, 56),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: GNav(
          onTabChange: onTapChanged,
          gap: 1,
          iconSize: 21,
          activeColor: const Color.fromARGB(255, 8, 15, 56),
          tabBackgroundColor: Colors.white,
          padding:
              EdgeInsets.symmetric(vertical: 13, horizontal: isAdmin ? 13 : 28),
          color: const Color.fromARGB(255, 255, 255, 255),
          tabs: isAdmin
              ? [
                  GButton(
                    icon: UIcons.regularRounded.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: UIcons.regularRounded.ticket,
                    text: 'Tickets',
                  ),
                  GButton(
                    icon: UIcons.regularRounded.apps_add,
                    text: 'Dashboard',
                  ),
                  GButton(
                    icon: UIcons.regularRounded.user,
                    text: 'Profile',
                  ),
                ]
              : [
                  GButton(
                    icon: UIcons.regularRounded.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: UIcons.regularRounded.ticket,
                    text: 'Tickets',
                  ),
                  GButton(
                    icon: UIcons.regularRounded.user,
                    text: 'Profile',
                  ),
                ]),
    );
  }
}
