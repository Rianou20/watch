//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:chrolix/models/favorite_models.dart';
import 'package:chrolix/models/home_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chrolix/screen/home_screen.dart';
import 'package:chrolix/screen/favoris_screen.dart';
import 'package:chrolix/screen/parametres_screen.dart';
import 'package:provider/provider.dart';


class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MyHome(),
    Favoris(),
    Parametres(),
  ];


void _onItemTap(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

 @override
 Widget build(BuildContext context) {
   return MultiProvider(
      providers: [
        Provider(create: (context) => FavModel()),
        ChangeNotifierProxyProvider<HomeModel, FavModel>(
          create: (context) => FavModel(),
          update: (context, catalog, fav) {
            fav.catalog = catalog;
            return fav;
          },
        ),
      ],
      child: Scaffold(   
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
         fixedColor: Colors.white,
         items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
            ),
          ],      
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTap,
        elevation: 1,
        ),
      ),
   );
  } 
}