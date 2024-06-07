import 'package:flutter/material.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/views/home/earthquake.dart';
import 'package:weatherapp_v2/views/home/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const GempaPage(),
    // ChatBotPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.greenDarkBlue,
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        // clipper: RoundedClipper(),
        child: BottomNavigationBar(
          backgroundColor: ColorsCollection.blueDark,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorsCollection.whiteNeutral,
          unselectedItemColor: ColorsCollection.greyNeutral,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          elevation: 0.0,
          selectedFontSize: 16.0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warning),
              label: 'Gempa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'ChatBot',
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(0, size.height, 30, size.height);
    path.lineTo(size.width - 30, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
