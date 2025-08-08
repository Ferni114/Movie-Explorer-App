import 'package:flutter/material.dart';
import '../../../../../../features/populars/presentation/pages/populars_page.dart';
import '../../../../../../features/searches/presentation/pages/searches_page.dart';
import '../../../../../../features/favorites/presentation/pages/favorites_page.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Movie Explorer App',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff000000)),
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xff424242)),
      actions: [
        // IconButton(icon: const Icon(Icons.search), onPressed: () {}),
      ],
    );
  }

  Widget _body() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: [
        Populars(),
        Searches(),
        Favorites(),
      ],
    );
  }

  Theme _navigationBottom(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: const Color(0xffffffff)),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFF424242),
            unselectedItemColor: const Color(0xFFD8D8D8),
            currentIndex: _currentIndex,
            onTap: (index) async {_pageController.jumpToPage(index);},
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_fire_department),
                label: 'Populars',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _navigationBottom(context),
    );
  }
}
