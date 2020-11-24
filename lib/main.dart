//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:chrolix/models/favorite_models.dart';
import 'package:chrolix/models/home_models.dart';
import 'package:chrolix/screen/favoris_screen.dart';
import 'package:chrolix/screen/home_screen.dart';
import 'package:chrolix/screen/parametres_screen.dart';
import 'package:flutter/material.dart';
import 'package:chrolix/others/nav.dart';
import 'package:chrolix/others/theme.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavModel()),
        Provider(create: (context) => HomeModel()),
        ChangeNotifierProxyProvider<HomeModel, FavModel>(
          create: (context) => FavModel(),
          update: (context, catalog, fav) {
            fav.catalog = catalog;
            return fav;
          },
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: light,
          darkTheme: dark,
          home: BottomTabScreen(),
        ),
    );
  }
}

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {'page': MyHome(), 'title': 'Home'},
      {'page': Favoris(), 'title': 'Favorites'},
      {'page': Parametres(), 'title': 'Setting'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourities'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          )
        ],
      ),
    );
  }
}
