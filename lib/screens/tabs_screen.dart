import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/favorite_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int selectPageIndex = 0;

  void initState() {
    _pages = [
      {'pages': CategoriesScreen(), 'title': 'Categories'},
      {
        'pages': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      }
    ];
    super.initState();
  }

  void selectPage(int indeex) {
    setState(() {
      selectPageIndex = indeex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectPageIndex]['title']),
        /* bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(icon: Icon(Icons.star), text: 'Favorites'),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[CategoriesScreen(), FavoriteScreen()],*/
      ),
      drawer: MainDrawer(),
      body: _pages[selectPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
