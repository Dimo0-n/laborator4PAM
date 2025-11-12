import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String source;
  final String date;
  final String tag;
  final String logoPath;

  const TrendingCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.source,
    required this.date,
    required this.tag,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  imagePath,
                  height: 161,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 10,
                left: 18,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 8),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                // logo-ul BBC real
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      logoPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Source name
                Text(
                  source,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.verified,
                  size: 16,
                  color: Colors.blue,
                ),
                const Spacer(),
                // Date
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
