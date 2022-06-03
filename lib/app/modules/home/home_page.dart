import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/data/model/tex.dart';
import 'package:getx/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(items: [
              BottomNavigationBarItem(
                label: 'ho',
                icon: Icon(Icons.abc_outlined),
              ),
              BottomNavigationBarItem(
                label: 'ou',
                icon: Icon(Icons.abc_outlined),
              ),
            ]),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.snackbar('Hola mundo', 'i am a modern snackbar',
                            backgroundColor: Colors.black45,
                            icon: Icon(Icons.bed));
                      },
                      child: Text('Snackbar'),
                    ),
                    TextButton(
                      onPressed: () {
                        _.initScan();
                      },
                      child: Text('Default Dialog'),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            color: Colors.black38,
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                    leading: Icon(Icons.music_note),
                                    title: Text('Music'),
                                    onTap: () {}),
                                ListTile(
                                  leading: Icon(Icons.videocam),
                                  title: Text('Video'),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Text('BottomSheet'),
                    ),
                    TextButton(
                        onPressed: () {
                          Map<String, dynamic> map = json.decode(
                              '{"hola": null, "entero": null, "userBool":null}');
                          Tex a = Tex.fromJson(map);
                          Tex b = a;
                          b.entero = 234;
                          print(a.entero);
                          print(a.hola);
                          print(a.userBool);
                          print(b.entero);
                        },
                        child: Text('test')),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
