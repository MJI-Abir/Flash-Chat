import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flash_chat/core/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: const Color(0xFF03443D),
        child: ContainedTabBarView(
          tabBarViewProperties: const TabBarViewProperties(),
          tabBarProperties: const TabBarProperties(
            unselectedLabelColor: Color(0xFFB3D9D2),
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
          views: [const ChatsView(), Container(color: Colors.green)],
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
    return Scaffold(
      backgroundColor: const Color(0xFF03443D),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 10),
            Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: ListView.builder(
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 5,
                                  child: Text(
                                    'Messages',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  alignment: Alignment.centerRight,
                                  onPressed: () {},
                                  icon: const Icon(Icons.search),
                                ),
                                IconButton(
                                  alignment: Alignment.centerRight,
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                          )
                        : const ListTile(
                            title: Text('data'),
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('images/profile.jpeg'),
                              backgroundColor: Colors.white,
                            ),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
