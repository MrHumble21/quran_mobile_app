import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:quran/tasbeeh/tasbeeh_main_screen.dart';
//------------------    ----------------//
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:quran/widgets/ListOfSura.dart';

class SurahListScrollable extends StatefulWidget {
  const SurahListScrollable({Key? key}) : super(key: key);

  @override
  State<SurahListScrollable> createState() => _SurahListScrollableState();
}

class _SurahListScrollableState extends State<SurahListScrollable> {
  List<Widget> NavItems = [ListOfSurah(), TasbeehMainScreen()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavItems[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index =  value;
          });
        } ,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: index,
        selectedItemColor: Colors.blueGrey.shade900,
        unselectedItemColor: Colors.blueGrey.shade500,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              activeIcon: Icon(
                Icons.book_rounded,
                color: Colors.pink,
              ),
              label: "Quran"),
          BottomNavigationBarItem(
              icon: Icon(Icons.countertops),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
        ],
      ),
    );
  }

  void _onItemTapped(int value) {}
}
