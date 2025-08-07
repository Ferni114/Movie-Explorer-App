import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
// import 'movie_detail.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => Home(),
      routes: [
        /* GoRoute(
          path: 'movie/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return MovieDetail(movieId: id);
          },
        ),*/
      ],
    ),
  ],
  initialLocation: '/home',
);
