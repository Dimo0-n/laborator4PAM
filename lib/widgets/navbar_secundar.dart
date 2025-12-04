import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar navBarSecund({required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 60,
    title: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
    leading: Padding(
      padding: const EdgeInsets.only(top: 0, left: 18),
      child: Builder(
        builder: (context) => IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: SvgPicture.asset(
            'assets/back_arow.svg',
            width: 52,
            height: 52,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 0, right: 8),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/settings_navbar.svg',
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
