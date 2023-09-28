import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flash_chat/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: SafeArea(
        child: ContainedTabBarView(
          tabBarViewProperties: const TabBarViewProperties(),
          tabBarProperties: const TabBarProperties(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
          ),
          tabs: const [
            Text(
              'Chats',
              style: kTabBarTextStyle,
            ),
            Text(
              'Calls',
              style: kTabBarTextStyle,
            ),
          ],
          views: [
            const ChatsView(),
            Container(color: Colors.green)
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}

class ChatsView extends StatelessWidget {
  const ChatsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Container(
                margin: const EdgeInsets.all(10),
                child: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('images/profile.jpeg'),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
