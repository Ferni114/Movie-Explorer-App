import 'package:flutter/material.dart';
import '../../features/populars/presentation/pages/populars_page.dart';

class Home extends StatelessWidget {
  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xff424242)),
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
      ],
    );
  }

  Widget _body() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      // controller: _pageController,
      children: [Populars()],
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
            currentIndex: 0,
            onTap: (index) async {},
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