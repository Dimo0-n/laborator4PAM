import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lab2/presentation/controllers/controller_status.dart';
import 'package:lab2/presentation/controllers/main_controller.dart';
import 'package:lab2/presentation/list_items/data_model_list_item.dart';
import 'package:lab2/presentation/list_items/recommendation_list_item.dart';
import 'package:lab2/presentation/list_items/trending_news_list_item.dart';
import 'package:lab2/presentation/list_items/welcome_list_item.dart';
import 'package:lab2/widgets/data_card_widget.dart';
import 'package:lab2/widgets/navbar_principale.dart';
import 'package:lab2/widgets/recommendation_post.dart';
import 'package:lab2/widgets/trending_news.dart';
import 'package:lab2/widgets/welcome_message_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MainController controller;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<MainController>()) {
      Get.lazyPut(() => MainController());
    }
    controller = Get.find<MainController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: navBar(
        title: "",
        onLeadingTap: controller.changeName,
      ),
      body: Obx(() {
        final ControllerStatus currentStatus = controller.status.value;
        if (currentStatus == ControllerStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (currentStatus == ControllerStatus.error) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.errorMessage.value ?? 'Unknown error',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.loadData,
                  child: const Text('Reîncearcă'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = controller.items[index];
            if (item is WelcomeListItem) {
              return WelcomeMessageWidget(item: item);
            } else if (item is TrendingNewsListItem) {
              return TrendingNewsWidget(items: item.items);
            } else if (item is RecommendationListItem) {
              return RecommendationWidget(
                isHomePage: item.isHomePage,
                data: item.recommendation,
              );
            } else if (item is DataModelListItem) {
              return DataCardWidget(model: item.data);
            }
            return const SizedBox.shrink();
          },
        );
      }),
    );
  }
}
