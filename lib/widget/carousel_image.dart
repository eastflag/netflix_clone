import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({required this.movies});

  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
        ),
        CarouselSlider(
          items: images,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            }
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
          child: Text(_currentKeyword, style: TextStyle(fontSize: 12),)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                likes[_currentPage] ? IconButton(onPressed: () {}, icon: const Icon(Icons.check)) :
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                const Text('내가찜한콘텐츠', style: TextStyle(fontSize: 11),),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.play_arrow, color: Colors.black,),
                    Padding(padding: EdgeInsets.all(3)),
                    Text('재생', style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
                const Text('정보', style: TextStyle(fontSize: 11),),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: makeIndicator(movies, _currentPage),
        )
      ],
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for(var i = 0; i < list.length; i++) {
    results.add(Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: _currentPage == i ? Color.fromRGBO(255, 255, 255, 0.9) : Color.fromRGBO(255, 255, 255, 0.4))));
  }

  return results;
}