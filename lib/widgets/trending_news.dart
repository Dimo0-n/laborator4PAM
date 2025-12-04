import 'package:flutter/material.dart';

import '../models/trending_news_model.dart';
import 'trending_news_element.dart';

class TrendingNewsWidget extends StatelessWidget {
  const TrendingNewsWidget({
    super.key,
    required this.items,
  });

  final List<TrendingNewsModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Trending news',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'See all    ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 325,
            child: items.isEmpty
                ? const Center(child: Text('No trending news available'))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return TrendingCard(
                        title: item.title,
                        imagePath: item.image,
                        source: item.publisher,
                        date: item.date,
                        tag: item.category,
                        logoPath: item.publisherIcon,
                        isVerified: item.isVerified,
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),

        ],
      ),
    );
  }
}
