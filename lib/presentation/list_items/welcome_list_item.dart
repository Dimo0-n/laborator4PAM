import 'home_list_item.dart';

class WelcomeListItem extends HomeListItem {
  const WelcomeListItem({
    required this.userName,
    required this.subtitle,
  });

  final String userName;
  final String subtitle;

  WelcomeListItem copyWith({
    String? userName,
    String? subtitle,
  }) {
    return WelcomeListItem(
      userName: userName ?? this.userName,
      subtitle: subtitle ?? this.subtitle,
    );
  }
}
