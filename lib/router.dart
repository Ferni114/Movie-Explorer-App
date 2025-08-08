import 'package:go_router/go_router.dart';

import 'features/home/presentation/pages/home_page.dart';
import '../features/moviedetail/presentation/pages/movie_detail_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => Home(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id']!);
            return MovieDetail(id!);
          },
        ),
      ],
    ),
  ],
  initialLocation: '/home',
);
