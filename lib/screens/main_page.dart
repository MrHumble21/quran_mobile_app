import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quran/tabs.dart';
import 'package:quran/utils/layout.dart';
import 'package:quran/utils/styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Al-Quran',
                style: StyleCollections.headerTextDark2,
                textAlign: TextAlign.left)
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Container(
                      width: AppLayout.getScreenWidth() *95,
                      height: AppLayout.getScreenWidth() < 400 ? 120 :150,
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
                                style: StyleCollections.headerTextLight,
                              ),
                              const Gap(10),
                              Text(
                                'Abdulboriy \nMalikov',
                                style: StyleCollections.headerTextDark2,
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
                  const Gap(10),

                  CustomTabs()
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }
}




