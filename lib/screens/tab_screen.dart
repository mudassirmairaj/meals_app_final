import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
class TabScreen extends StatefulWidget {

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavoriteScreen(),
  ];
  int _selectPageIndex = 0;
  void _selectPage(int index){
setState(() {
  _selectPageIndex = index;
});
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Meals'),
      ),
      body: _pages[_selectPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [

          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon:  Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(backgroundColor:Theme.of(context).primaryColor, icon:  Icon(Icons.star), title: Text('Favorite'))
        ],
      ),
    );
  }
}
