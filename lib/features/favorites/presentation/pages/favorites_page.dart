import 'package:flutter/material.dart';
import '../widgets/favorite_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/favorites_bloc.dart';
import '../bloc/favorites_event.dart';
import '../bloc/favorites_state.dart';
import '../../../../core/di/injection.dart';

class Favorites extends StatelessWidget {
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

  Widget _gridWidget() {
    return BlocBuilder<FavoritesBloc, FavoritesState>(builder: (_, state) {
      if (state is FavoritesDone) {
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 280,
              crossAxisSpacing: (5),
              mainAxisSpacing: 5,
              childAspectRatio: 3 / 5,
            ),
            itemCount: (state.favorite?.length ?? 0),
            itemBuilder: (context, index) {
              return InkWell(onTap: () {}, child: Favorite((state.favorite![index])));
            },
          ),
        );
      }
      if (state is FavoritesLoading) {
        return _loading();
      } else {
        return _error();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesBloc>(
        create: (context) => sl()..add(const GetFavorites(1)),
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xffffffff),
            padding: const EdgeInsets.all(0),
            child: _gridWidget(),
          ),
        ));
  }
}
