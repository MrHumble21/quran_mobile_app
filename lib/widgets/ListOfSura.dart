import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:quran/screens/surah_screen.dart';
import 'package:quran/utils/layout.dart';
import 'package:quran/utils/styles.dart';

class ListOfSurah extends StatefulWidget {
  const ListOfSurah({Key? key}) : super(key: key);

  @override
  State<ListOfSurah> createState() => _ListOfSurahState();
}

class _ListOfSurahState extends State<ListOfSurah> {
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Container(
                    width: AppLayout.getScreenWidth() * 95,
                    height: AppLayout.getScreenWidth() < 400 ? 120 : 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xffDF98FA),
                            Color(0xFF9055FF),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Asslamu alaikum',
                              style: StyleCollections.headerTextLight
                                  .copyWith(color: Colors.white),
                            ),
                            const Gap(10),
                            Text(
                              'Abdulboriy \nMalikov',
                              style: StyleCollections.headerTextDark2
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // Container(),
                      Positioned(
                          bottom: 5,
                          right: 2,
                          child: Image.asset('./images/Quran.png'))
                    ]),
                  ),
                ),
              ),
            ),
          ),
          expandedHeight: 150,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SurahPage(index: surahList[index]['number']),
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
                          top: surahList[index]['number'] > 99 ? 10 : 9,
                          left: surahList[index]['number'] > 9 ? 8.5 : 13,
                          child: Text(
                            surahList[index]['number'].toString(),
                            style: StyleCollections.bodyTextDark.copyWith(
                                fontSize: surahList[index]['number'] > 99
                                    ? 12
                                    : null),
                          ))
                    ],
                  ),
                  title: Text(
                    surahList[index]['englishName'].toString().toUpperCase(),
                    style:
                    StyleCollections.bodyTextDark.copyWith(fontSize: 19),
                  ),
                  subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        surahList[index]['name'],
                        style: StyleCollections.bodyTextDark.copyWith(
                          fontSize: 18,
                        ),
                      )),
                  trailing: surahList[index]['revelationType'] == 'Meccan'
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
            // Builds 1000 ListTiles
            childCount: surahList.length,
          ),
        )
      ],
    );
  }
}
