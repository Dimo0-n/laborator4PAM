import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/widgets/chanel_description.dart';
import 'package:lab2/widgets/navbar_secundar.dart';

import 'package:lab2/domain/models/feed_details_response.dart';
import 'package:lab2/presentation/controllers/controller_status.dart';
import 'package:lab2/presentation/controllers/details_controller.dart';
import 'package:lab2/widgets/chanel_info.dart';
import 'package:lab2/widgets/post_details_search_bar.dart';
import 'package:lab2/widgets/recommendation_post.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  late final DetailsController controller;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<DetailsController>()) {
      Get.lazyPut(() => DetailsController());
    }
    controller = Get.find<DetailsController>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ControllerStatus current = controller.status.value;
      final detail = controller.details.value;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: navBarSecund(
          title: detail?.publisher.username ?? "forbesnews",
        ),
        body: _buildBody(current, detail),
      );
    });
  }

  Widget _buildBody(ControllerStatus current, FeedDetailsResponse? detail) {
    if (current == ControllerStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (current == ControllerStatus.error) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(controller.errorMessage.value ?? 'Unable to load details'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: controller.loadDetails,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (detail == null) {
      return const Center(child: Text('No details available'));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChannelInfo(
            logoPath: detail.publisher.logo,
            newsCount: detail.publisher.stats.newsCount,
            followers: detail.publisher.stats.followers,
            following: detail.publisher.stats.following,
            isFollowing: detail.publisher.isFollowing,
          ),
          ChannelDescription(
            name: detail.publisher.name,
            bio: detail.publisher.bio,
            verified: detail.publisher.verified,
          ),
          SearchBa(
            publisherName: detail.publisher.name,
            activeSort: detail.filters.activeSort,
          ),
          ...detail.news.map(
            (news) => RecommendationWidget(
              isHomePage: false,
              data: news,
            ),
          ),
        ],
      ),
    );
  }
}
