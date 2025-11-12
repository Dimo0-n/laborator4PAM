import 'package:flutter/material.dart';

import '../list_items/welcome_list_item.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({
    super.key,
    required this.item,
  });

  final WelcomeListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 24),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Welcome back, ${item.userName}!\n',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: item.subtitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
