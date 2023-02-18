import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

ValueNotifier<int> bottomNavigationBarIndexNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bottomNavigationBarIndexNotifier,
      builder: (context, newIndex, child) => BottomNavigationBar(
        currentIndex: newIndex,
        onTap: (value) {
          bottomNavigationBarIndexNotifier.value = value;
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.collections,
            ),
            label: 'New & Hot',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tag_faces_outlined,
            ),
            label: 'Fast laugh',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.download_for_offline_outlined,
            ),
            label: 'Download',
          ),
        ],
      ),
    );
  }
}
