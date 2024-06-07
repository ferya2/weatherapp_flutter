import 'package:flutter/material.dart';
import 'package:animations/animations.dart'; // Import package animations
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/views/home/chatbot.dart';
import 'package:weatherapp_v2/views/home/earthquake.dart';
import 'package:weatherapp_v2/views/home/homepage.dart';
import 'package:weatherapp_v2/views/home/articlepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.greenDarkBlue,
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType
                .horizontal, // Gunakan horizontal untuk slide
            child: child,
          );
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            HomePage(),
            GempaPage(),
            ChatBotPage(),
            ArticlePage(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          CustomBottomNavigationBarItem(
            icon: Icons.home_outlined,
            label: 'Home',
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.warning_amber_outlined,
            label: 'Gempa',
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.chat_outlined,
            label: 'ChatBot',
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.book_outlined,
            label: 'Article',
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<CustomBottomNavigationBarItem> items;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorsCollection.blueDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          final int index = items.indexOf(item);
          final bool isSelected = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorsCollection.blueLight.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    color: isSelected
                        ? ColorsCollection.whiteNeutral
                        : ColorsCollection.greyNeutral,
                  ),
                  const SizedBox(width: 5),
                  if (isSelected)
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected
                            ? ColorsCollection.whiteNeutral
                            : ColorsCollection.greyNeutral,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final IconData icon;
  final String label;

  const CustomBottomNavigationBarItem({
    required this.icon,
    required this.label,
  });
}
