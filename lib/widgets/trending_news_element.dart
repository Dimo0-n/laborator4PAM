import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String source;
  final String date;
  final String tag;
  final String logoPath;
  final bool isVerified;

  const TrendingCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.source,
    required this.date,
    required this.tag,
    required this.logoPath,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth - 48; // padding 18 + margin 12
    return Container(
      width: cardWidth.clamp(240, 320),
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
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, _, __) => Container(
                      color: Colors.grey.shade300,
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
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
            padding: const EdgeInsets.only(left: 18, top: 8, right: 18),
            child: Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
                    child: Image.network(
                      logoPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, _, __) => Container(
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image, size: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Source name
                Expanded(
                  child: Text(
                    source,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                if (isVerified)
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
