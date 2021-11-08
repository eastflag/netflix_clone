import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/widget/carousel_image.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로매스/판타지',
      'poster': 'test_1.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로매스/판타지',
      'poster': 'test_1.jpg',
      'like': false
    }),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: [
            CarouselImage(movies: movies),
            TopBar()
          ],
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/netflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          const Text(
            'TV프로그램',
            style: TextStyle(fontSize: 12, color: Colors.white60),
          ),
          const Text(
            '영화',
            style: TextStyle(fontSize: 12, color: Colors.white60),
          ),
          const Text(
            '내가찜한콘텐츠',
            style: TextStyle(fontSize: 12, color: Colors.white60),
          )
        ],
      ),
    );
  }
}