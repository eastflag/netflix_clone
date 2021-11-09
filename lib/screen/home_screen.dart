import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/widget/box_slider.dart';
import 'package:netflix_clone/widget/carousel_image.dart';
import 'package:netflix_clone/widget/circle_slider.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Movie> movie = [];

    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('movie').get(),
      builder: (context, querySnapshot) {
        if (querySnapshot.hasData) {
          // <3> Retrieve `List<DocumentSnapshot>` from snapshot
          print(querySnapshot.data!.docs);
          querySnapshot.data!.docs.forEach((documentSnapshot) {
            movie.add(Movie.fromSnapshot(documentSnapshot));
          });

          print(movie);

          return ListView(
            children: <Widget>[
              Stack(
                children: [
                  CarouselImage(movies: movie),
                  TopBar()
                ],
              ),
              CircleSlider(movies: movie),
              BoxSlider(movies: movie),
            ],
          );
        } else if (querySnapshot.hasError) {
          return Text('Error!');
        }
        return Text('loading...');
      },
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