import 'package:flutter/material.dart';

class ChannelDescription extends StatelessWidget {
  const ChannelDescription({
    super.key,
    required this.name,
    required this.bio,
    this.verified = false,
  });

  final String name;
  final String bio;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (verified) ...[
                const SizedBox(width: 8),
                const Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          // Descrierea
          Text(
            bio,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
