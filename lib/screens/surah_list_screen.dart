// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/constants.dart';
import 'package:quran/screens/surah_screen.dart';
import 'package:quran/utils/styles.dart';
import 'package:get/get.dart';

class SurahList extends StatefulWidget {
  const SurahList({Key? key}) : super(key: key);

  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  List surahList = [];
  Future res() async {
    final response = await rootBundle.loadString('./assets/surahs.json');
    final data = await json.decode(response);
    setState(() {
      surahList = data["data"];
      // print(surahList);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    res();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // height:  ,
      child: ListView(scrollDirection: Axis.vertical, children: [
        ...(surahList.map(
          (e) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahPage(index: e['number']),
                  ));
            },
            child: Card(
              child: ListTile(
                leading: Stack(
                  children: [
                    const Image(
                      image: AssetImage('./images/star.png'),
                    ),
                    Positioned(
                        top: e['number'] > 99 ? 10 : 9,
                        left: e['number'] > 9 ? 8.5 : 13,
                        child: Text(
                          e['number'].toString(),
                          style: StyleCollections.bodyTextDark
                              .copyWith(fontSize: e['number'] > 99 ? 12 : null),
                        ))
                  ],
                ),
                title: Text(
                  e['englishName'].toString().toUpperCase(),
                  style: StyleCollections.bodyTextDark.copyWith(fontSize: 19),
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      e['name'],
                      style: StyleCollections.bodyTextDark.copyWith(
                        fontSize: 18,
                      ),
                    )),
                trailing: e['revelationType'] == 'Meccan'
                    ? Image.asset(
                        './images/mecca.png',
                        width: 35,
                      )
                    : Image.asset(
                        './images/madina.png',
                        width: 35,
                      ),
              ),
            ),
          ),
        )),
      ]),
    );
  }
}
