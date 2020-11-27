# watch

 This is my code but I have this error : 

```lang-none
════════ Exception caught by widgets library ═══════════════════════════════════
The method '%' was called on null.
Receiver: null
Tried calling: %(20)
The relevant error-causing widget was
ChangeNotifierProxyProvider<HomeModel, FavModel>                lib\main.dart:24
════════════════════════════════════════════════════════════════════════════════
```

This error bring me at my main.dart file.

**main.dart**
````
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
````

I think my provider is good but I don't know how to fix my problem...
 
The line 24 of **main.dart** is : `ChangeNotifierProxyProvider<HomeModel, FavModel>`

I have tried to solve this error with the others questions which are opening on stack overflow but I don't manage to solve my error.

If you want the code of **HomeModel.dart** or **FavModel.dart**, tell me.
