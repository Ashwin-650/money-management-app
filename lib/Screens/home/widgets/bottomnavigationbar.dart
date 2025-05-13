import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/home/homescreen.dart';

class MoneyBottomnavigationbar extends StatelessWidget {
  const MoneyBottomnavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Homescreen.selectedIndexNotifier,
      builder: (BuildContext context, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey[600],
            currentIndex: updatedIndex,
            onTap: (newIndex) {
              Homescreen.selectedIndexNotifier.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Transcations'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories')
            ]);
      },
    );
  }
}
