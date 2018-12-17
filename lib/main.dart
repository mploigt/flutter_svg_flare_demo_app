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

Widget text() => Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id euismod sapien, sit amet viverra sapien. Aliquam augue felis, congue sed bibendum id, finibus at purus.',
      style: TextStyle(fontSize: 20.0),
    );

Row svgItems() => Row(children: [
      SvgPicture.asset('assets/checkOn_30px.svg',
          color: Colors.black, width: 30.0, height: 30.0),
      SvgPicture.asset('assets/checkOff_30px.svg',
          color: Colors.red, width: 30.0, height: 30.0),
      SvgPicture.asset('assets/add_40px.svg',
          color: Colors.green, width: 40.0, height: 40.0),
      SvgPicture.asset('assets/remove_40px.svg',
          color: Colors.blue, width: 40.0, height: 40.0),
    ]);

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SVG render bug demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
                text(),
                svgItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
