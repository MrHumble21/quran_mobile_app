import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/utils/styles.dart';

class TasbeehMainScreen extends StatefulWidget {
  const TasbeehMainScreen({Key? key}) : super(key: key);

  @override
  State<TasbeehMainScreen> createState() => _TasbeehMainScreenState();
}

class _TasbeehMainScreenState extends State<TasbeehMainScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              const Center(child: Padding(
                padding: EdgeInsets.all(7.0),
                child: Text("Islamic Counter", style: TextStyle(
                    fontSize: 25
                ),),
              ),),
              Center(
                child: Container(
                  height: 90,
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
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  width: 90,
                  child: Center(
                      child: Text(
                    count.toString(),
                    style: StyleCollections.headerTextDark2
                        .copyWith(color: Colors.white),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDF98FA),
                        elevation: 5,
                        shape: CircleBorder()

                    ),
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text("+", style: TextStyle(
                        fontSize: 35
                      ),),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9055FF),
                        elevation: 5,
                      shape: CircleBorder()
                        ),
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text("-", style: TextStyle(
                          fontSize: 35
                      ),),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
