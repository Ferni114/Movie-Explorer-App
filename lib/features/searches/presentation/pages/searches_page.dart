import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../widgets/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/searches_bloc.dart';
import '../bloc/searches_event.dart';
import '../bloc/searches_state.dart';
import '../../../../core/di/injection.dart';

class Searches extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  Widget _searchBox(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Buscar película...',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                context
                .read<SearchesBloc>()
                .add(GetSearches({"query": "", "page": 1}));
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.grey[100],
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
          },
          onChanged: (value) {
            context
                .read<SearchesBloc>()
                .add(GetSearches({"query": "$value", "page": 1}));
          },
        ));
  }

  Widget _empty() {
    return const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        Icons.search,
        size: (80),
        color: Colors.grey,
      ),
      SizedBox(height: 16),
      Text(
        'Busque una Pelicula',
        style: TextStyle(
          fontSize: (18),
          fontWeight: FontWeight.w500,
        ),
      )
    ]));
  }

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
    return BlocBuilder<SearchesBloc, SearchesState>(builder: (_, state) {
      if (state is SearchesDone) {
        if ((state.popular?.results.length ?? 0) > 0) {
          return Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 280,
                crossAxisSpacing: (5),
                mainAxisSpacing: 5,
                childAspectRatio: 3 / 5,
              ),
              itemCount: (state.popular?.results.length ?? 0),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      context.push(
                          '/home/movie/${state.popular?.results[index].id}');
                    },
                    child: Search((state.popular?.results[index])!));
              },
            ),
          );
        } else {
          return _empty();
        }
      }
      if (state is SearchesLoading) {
        return _loading();
      } else {
        return _error();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchesBloc>(
        create: (contextB) =>
            sl()..add(const GetSearches({"query": "", "page": 1})),
        child: Scaffold(
          body: Container(
            width: double.infinity,
            color: Color(0xffffffff),
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(builder: (contextb) => _searchBox(contextb)),
                _gridWidget(),
              ],
            ),
          ),
        ));
  }
}
