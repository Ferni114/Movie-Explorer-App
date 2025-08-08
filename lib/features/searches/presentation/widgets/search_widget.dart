import 'package:flutter/material.dart';
import '../../domain/entities/search_entity.dart';
import '../../../../../core/env/env.dart';

class Search extends StatelessWidget {
  SearchEntity popular;
  Search(this.popular);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width / ((width > 210) ? (9 / 10) : (1 / 1));

        return Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: (0),
              ),
            ],
          ),
          child: Column(
            children: [
              (true)
                  ? ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        "${URLPoster+popular.poster}",
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset("assets/error.png", width: 160, height: 120),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${popular.title}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (18),
                          fontWeight: FontWeight.bold,
                          color: Color(0xff434242),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${popular.date}",
                        style: TextStyle(
                          fontSize: (13),
                          fontWeight: FontWeight.bold,
                          color: Color(0xffb3b2b2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
