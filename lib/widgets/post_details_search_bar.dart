import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBa extends StatelessWidget {
  const SearchBa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header cu titlu și controale de view
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'News by Forbes',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Sort by dropdown
          Row(
            children: [
              Text(
                'Sort by: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                'Newest',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 18,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/search_icon2.svg',
                          width: 24,
                          height: 24,
                        ), onPressed: () {  },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/search_icon1.svg',
                          width: 24,
                          height: 24,
                        ), onPressed: () {  },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Search bar
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Container(
              width: 392,
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Search "News"',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}