import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/views/home/home_view.dart';
import 'package:evening_flow/views/mood/mood_view.dart';
import 'package:evening_flow/views/routines/routines_view.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [HomeView(), RoutinesView(), MoodView()];

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Deine Abendroutine";
      case 1:
        return "Deine Routinen";
      case 2:
        return "Deine Stimmung";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      appBar: AppBar(
        title: Text(_getTitle(_currentIndex)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const SizedBox(
              height: 48,
              width: 48,
              child: Icon(
                Icons.settings_outlined,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // unselectedFontSize: 12,
        // selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: "Home".toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.checklist),
            label: "Routinen".toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.emoji_emotions_outlined),
            label: "Stimmung".toUpperCase(),
          ),
        ],
      ),
    );
  }
}
