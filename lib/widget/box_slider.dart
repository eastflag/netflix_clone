import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  const BoxSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('지금 뜨는 콘텐츠'),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makeCircleImages(movies),
              ),
            ),
          ],
        )
    );
  }
}

List<Widget> makeCircleImages(List<Movie> movies) {
  return movies.map((m) => InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.only(right: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset('images/' + m.poster),
      ),
    ),
  )).toList();
}