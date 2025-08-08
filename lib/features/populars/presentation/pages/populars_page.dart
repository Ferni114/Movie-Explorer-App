import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/popular_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/populars_bloc.dart';
import '../bloc/populars_event.dart';
import '../bloc/populars_state.dart';
import '../../../../core/di/injection.dart';

class Populars extends StatelessWidget {
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
    return BlocBuilder<PopularsBloc, PopularsState>(builder: (_, state) {
      if (state is PopularsDone) {
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 280,
              crossAxisSpacing: (5),
              mainAxisSpacing: 5,
              childAspectRatio: 3 / 5,
            ),
            itemCount: (state.popular?.results.length ?? 0),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    context.push('/home/movie/${state.popular?.results[index].id}');
                  },
                  child: Popular((state.popular?.results[index])!));
            },
          ),
        );
      }
      if (state is PopularsLoading) {
        return _loading();
      } else {
        return _error();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularsBloc>(
        create: (context) => sl()..add(const GetPopulars(1)),
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
