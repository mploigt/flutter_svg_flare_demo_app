import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVG render bug demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

List getFiles(type) {
  var dir = './Users/maik/AndroidStudioProjects/flutter_demo_app/assets/$type/';
  var iconDir = Directory(dir);
  var icons = [];
  iconDir
      .listSync(recursive: false, followLinks: false)
      .forEach((FileSystemEntity entity) {
    var fileName = entity.path.replaceFirst(dir, '');
    if (fileName.substring(0, 1) != '.') {
      icons.add(fileName);
    }
  });
  return icons;
}

Widget svgBuildIcon(image, type) =>
    SvgPicture.asset('assets/$type/$image', width: 30.0, height: 30.0);

Widget svgItems(type) => Wrap(
    children:
        getFiles(type).map((image) => svgBuildIcon(image, type)).toList());

Widget flareBuildAnimation(image, type, context) => SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.width / 2,
    child: FlareActor(
      'assets/$type/$image',
      animation: 'idle',
      fit: BoxFit.contain,
    ));

Widget flareItems(type, context) => Wrap(
    children: getFiles(type)
        .map((image) => flareBuildAnimation(image, type, context))
        .toList());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title:
              Text('Asset Render Demo', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(children: [
                svgItems('food'),
                svgItems('interface'),
                flareItems('flare', context)
              ]),
            )));
  }
}
