//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chrolix/others/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:chrolix/models/favorite_models.dart';
import 'package:chrolix/models/home_models.dart';
import 'package:chrolix/data/data.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//         title: Text('Accueil', style: kAppBarStyle,),
//          elevation: 0,
//          automaticallyImplyLeading: false,
//      ),
      body:  ListView.builder(
        scrollDirection: Axis.vertical,
//        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: itemData.length,
        itemBuilder: (context, index) => _MyListItem(index))
    );
  }
}

Icon iconNotFavorite = Icon(Icons.favorite_border, size: 32,);
Icon iconInFavorite = Icon(Icons.favorite, size: 32,);

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isFavorite = context.select<FavModel, bool>(
      (fav) => fav.items.contains(item),
    );

    return GestureDetector(
      onTap: isFavorite
          ? null
          : () {
              var fav = context.read<FavModel>();
              fav.add(item);
            },
      child: isFavorite ? iconInFavorite : iconNotFavorite,
    );
  }
}


// List Items
class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<HomeModel, Item>(

      (catalog) => catalog.getByPosition(index),
    );

    return Container(
      height: 75,
      child: ListTile(
        leading:CachedNetworkImage(
                  imageUrl: itemData[index].imageURL,
                  height: 100,
                  fit: BoxFit.cover,
                ),
        title:  Text(itemData[index].title, style: kItemTitle,),
        subtitle: Text(itemData[index].description, style: kItemDescription,),
        trailing: _AddButton(item: item),
      ),
    );

//    return Container(
//        child: new Row(
//          children: <Widget>[
//            //Image
//            new Container(
//              margin: new EdgeInsets.only(top: 5.0, left: 0.0),
//              child: new CachedNetworkImage(
//                imageUrl: itemData[index].imageURL,
//                height: 50,
//                width: 50,
//                fit: BoxFit.cover,
//              ),
//            ),
//            new Container(
//              height: MediaQuery.of(context).size.height / 5,
//              width: MediaQuery.of(context).size.width / 5,
//              child : new Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//            //Text
//                  new Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Spacer(),
//                   //Titre
//                    Container(
//                    padding: const EdgeInsets.only(top: 15.0 ),
//                    child: FittedBox(
//                      child: Text(
//                        itemData[index].title,
//                        style: kItemTitle,
//                        ),
//                    ),
//                    ),
//                    //Decription
//                    Container(
//                    padding: const EdgeInsets.only(left: 10.0, top: 15.0),
//                    child:Text(
//                      itemData[index].description,
//                      style: kItemDescription,
//                      ),
//                    ),
//                    Spacer(),
//                  ],
//                ),
//                Container(
//                padding: const EdgeInsets.only(top: 10.0),
//                child: CountdownTimer(
//                  daysSymbol: new Text("j "),
//                  hoursSymbol: new Text(" : "),
//                  minSymbol: new Text(" : "),
//                  secSymbol: new Text(""),
//                  endTime: itemData[index].countdown,
//                  textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                  onEnd: () {
//              print('onEnd');
//            },
//                ),
//                ),
//                Container(
//                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
//                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                  _AddButton(item: item),
//                ],),
//              ),
//              ],),
//            ),
//          ],
//        ),
//      );
  }
}