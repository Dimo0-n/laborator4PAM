import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar navBar({required String title, VoidCallback? onLeadingTap}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 60,
    title: Text(title, style: const TextStyle(color: Colors.black)),
    leading: Padding(
      padding: const EdgeInsets.only(top: 0, left: 18),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: SvgPicture.asset(
          'assets/lateral_menu.svg',
          width: 52,
          height: 52,
        ),
        onPressed: onLeadingTap ?? () {},
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 0, right: 8),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/notification.svg',
            width: 52,
            height: 52,
          ),
          onPressed: () {
            // logica pentru notificări
          },
        ),
      ),
    ],
  );
}
