import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:quran/utils/styles.dart';

import '../utils/layout.dart';

class SurahPage extends StatefulWidget {
  final int index;
  const SurahPage({Key? key, required this.index}) : super(key: key);
  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List surahList = [];
  List surahTranslate = [];
  late List sura;
  late List OneSurahTranslate;

  Future res() async {
    final response = await rootBundle.loadString('./assets/quran.json');
    final data = await json.decode(response);
    final response1 = await rootBundle.loadString('./assets/translate.json');
    final data1 = await json.decode(response1);
    setState(() {
      surahList = [
        data['data']['surahs']
            .where((element) => element['number'] == widget.index)
      ];
      surahTranslate = [
        data1['data']['surahs']
            .where((element) => element['number'] == widget.index)
      ];
      sura = surahList[0].toList()[0]['ayahs'];
      OneSurahTranslate = surahTranslate[0].toList()[0]['ayahs'];
      if (kDebugMode) {
        print(OneSurahTranslate[0]);
      }
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
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          ListTile(
            leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset('./images/back.png')),
            title: Text(surahList[0].toList()[0]['englishNameTranslation'], style: StyleCollections.headerTextDark2,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Container(
                width: AppLayout.getScreenWidth() * 75,
                height: 180,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        surahList[0].toList()[0]['englishName'],
                        style: StyleCollections.headerTextLight2
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const Gap(10),
                    Center(
                      child: Text(
                        surahList[0].toList()[0]['englishNameTranslation'],
                        style: StyleCollections.headerTextLight2
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      width: 200,
                      color: Colors.white,
                      height: 2,
                    ),
                    const Gap(10),
                    Center(
                      child: Text(
                        surahList[0].toList()[0]['revelationType'] +
                            " - " +
                            surahList[0]
                                .toList()[0]['ayahs']
                                .length
                                .toString() +
                            " Ayahs",
                        style: StyleCollections.headerTextLight2
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const Gap(10),
                    Center(
                      child: Image.asset('./images/name.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                const Gap(20),
                SizedBox(
                  height: 550,
                  child: ListView.builder(
                    itemCount: sura.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        // padding:
                        //     const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff1219310D),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRect(
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff863ED5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: StyleCollections.headerTextDark
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: Image.asset(
                                                './images/aaa.png')),
                                        TextButton(
                                            onPressed: () {},
                                            child: Image.asset(
                                                './images/Frame.png')),
                                        TextButton(
                                            onPressed: () {},
                                            child: Image.asset(
                                                './images/bookmark.png')),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                           const Gap(25),
                            ListTile(
                              title: Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  sura[index]['text'],
                                  style: StyleCollections.headerTextDark2,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              
                              subtitle: Text(OneSurahTranslate[index]['text'], style: StyleCollections.bodyTextDark, textAlign: TextAlign.right,),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
