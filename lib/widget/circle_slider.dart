import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  const CircleSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('미리보기'),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(movies, context),
            ),
          ),
        ],
      )
    );
  }
}

List<Widget> makeCircleImages(List<Movie> movies, BuildContext context) {
  return movies.map((m) => InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return DetailScreen(movie: m);
          })
      );
    },
    child: Container(
      padding: const EdgeInsets.only(right: 10),
      child: Align(alignment: Alignment.centerLeft, child: CircleAvatar(
        backgroundImage: AssetImage('images/' + m.poster),
        radius: 48,
      ),),
    ),
  )).toList();
}