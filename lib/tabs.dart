import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/screens/surah_list_screen.dart';
import 'package:quran/utils/styles.dart';

class CustomTabs extends StatefulWidget {
  const CustomTabs({Key? key}) : super(key: key);

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  int tabnumber = 0;
  List<Widget> tabs = [
    SurahList(),
    Text("Surah"),

    Text("Page"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    tabnumber = 0;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor:
                    tabnumber == 0 ? const Color(0xff863ED5) : null),
                child: Text(
                  "Surah",
                  style: StyleCollections.bodyTextDark
                      .copyWith(fontWeight: FontWeight.w900, letterSpacing: 3, color: tabnumber == 0 ? Colors.white : null)
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    tabnumber = 1;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor:
                        tabnumber == 1 ? const Color(0xff863ED5) : null),
                child: Text(
                  "Juz",
                  style: StyleCollections.bodyTextDark.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      color: tabnumber == 1 ? Colors.white : null),
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    tabnumber = 2;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor:
                        tabnumber == 2 ? const Color(0xff863ED5) : null),
                child: Text(
                  "Surah",
                  style: StyleCollections.bodyTextDark.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      color: tabnumber == 2 ? Colors.white : null),
                )),
          ],
        ),
        tabs[tabnumber]
      ],
    );
  }
}
