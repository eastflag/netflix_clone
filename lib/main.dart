import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'package:netflix_clone/screen/more_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EastflagFlex',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.white60,
        // accentColor: Colors.grey
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(child: const Center(child: Text('검색'))),
              Container(child: const Center(child: Text('목록'))),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      )
    );
  }
}
