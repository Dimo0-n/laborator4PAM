import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChannelInfo extends StatelessWidget {
  final String logoPath;
  final String newsCount;
  final String followers;
  final int following;
  final bool isFollowing;

  const ChannelInfo({
    super.key,
    required this.logoPath,
    required this.newsCount,
    required this.followers,
    required this.following,
    this.isFollowing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Logo
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 18),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 108,
              height: 108,
              child: _buildLogo(),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.only(left: 33, top: 32, right: 18),
                  child: SizedBox(
                    width: 256,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatText(newsCount, 'News'),
                        _buildStatText(followers, 'Followers'),
                        _buildStat(following, 'Following'),
                      ],
                    ),
                  )
              ),
                const SizedBox(height: 10),
                Padding(padding: EdgeInsets.only(left: 33, top: 10, right: 18),
                  child:
                    SizedBox(
                    height: 41,
                    width: 256,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFollowing ? Colors.grey.shade200 : Colors.black,
                        foregroundColor: isFollowing ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(isFollowing ? 'Following' : 'Follow'),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildStat(int count, String label) {
    return _buildStatText(count.toString(), label);
  }

  Widget _buildStatText(String count, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    if (logoPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        logoPath,
        fit: BoxFit.cover,
        placeholderBuilder: (_) => _placeholder(),
      );
    }
    return Image.network(
      logoPath,
      fit: BoxFit.cover,
      errorBuilder: (context, _, __) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey.shade300,
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image),
    );
  }
}
