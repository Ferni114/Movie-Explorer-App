import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/movie_detail_bloc.dart';
import '../bloc/movie_detail_event.dart';
import '../bloc/movie_detail_state.dart';
import '../../../../core/di/injection.dart';
import '../../../../../core/env/env.dart';

class MovieDetail extends StatelessWidget {
  int id;
  MovieDetail(this.id);

  Widget _error() {
    return const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        Icons.error_outline,
        size: (80),
        color: Colors.grey,
      ),
      SizedBox(height: 16),
      Text(
        'Hubo un error',
        style: TextStyle(
          fontSize: (18),
          fontWeight: FontWeight.w500,
        ),
      )
    ]));
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _poster(String url) {
    return (true)
        ? ClipRRect(
            child:
                Image.network(url, width: 450, height: 320, fit: BoxFit.cover))
        : Image.asset("assets/error.png", width: 160, height: 120);
  }

  Widget _title(String title) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: (25),
                fontWeight: FontWeight.bold,
                color: Color(0xff434242))));
  }

  Widget _releaseDate(String date) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(date,
            style: TextStyle(
                fontSize: (15),
                fontWeight: FontWeight.bold,
                color: Color(0xffa3a2a2))));
  }

  Widget _synopsis(String synopsis) {
    return Column(children: [
      const Align(
          alignment: Alignment.centerLeft,
          child: Text("Synopsis",
              style: TextStyle(
                  fontSize: (20),
                  fontWeight: FontWeight.bold,
                  color: Color(0xff434242)))),
      const SizedBox(height: 10),
      Align(
          alignment: Alignment.centerLeft,
          child: Text(synopsis,
              style: TextStyle(fontSize: (16), color: Color(0xff737272))))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailBloc>(
        create: (context) => sl()..add(GetMovieDetail(id)),
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ],
              title: Text('Detalle de película'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
            body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
                builder: (_, state) {
              if (state is MovieDetailDone) {
                return Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      _poster("${URLPoster + state.popular!.poster}"),
                      const SizedBox(height: 0),
                      Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(children: [
                            _title("${state.popular!.title}"),
                            const SizedBox(height: 5),
                            _releaseDate("${state.popular!.date}"),
                            const SizedBox(height: 20),
                            _synopsis("${state.popular!.synopsis}")
                          ]))
                    ])));
              }
              if (state is MovieDetailLoading) {
                return _loading();
              } else {
                return _error();
              }
            })));
  }
}
