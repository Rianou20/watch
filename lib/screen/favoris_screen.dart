//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:chrolix/others/constants.dart';
import 'package:chrolix/others/nav.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:chrolix/models/favorite_models.dart';
import 'package:provider/provider.dart';

class Favoris extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'Favoris', style: kAppBarStyle,
//        ),
//        elevation: 0,
//        automaticallyImplyLeading: false,
//        leading: GestureDetector(
//          child: Icon(
//            Icons.arrow_back,
//          ),
//        onTap: () {
//            Get.offAll(Nav());
//          },
//        ),
//      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: _FavList(),
              ),
          ],
        ),
      ),
    );
  }
}

class _FavList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fav = Provider.of<FavModel>(context);
    return ListView.builder(
      itemCount: fav.items.length,
      itemBuilder: (context, index) => 
      Container(
        child: new Row(
          children: <Widget>[
            //Image
            new Container(
              margin: new EdgeInsets.only(top: 5.0, left: 0.0),
              child: new CachedNetworkImage(
                imageUrl: fav.items[index].imageURL,
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
            ),
            new Container(
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 2,
              child : new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
            //Text
                  new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Spacer(),               
                   //Titre
                    Container(
                    padding: const EdgeInsets.only(top: 15.0 ),
                    child: Text(
                      fav.items[index].title,
                      style: kItemTitle,
                      ),
                    ),
                    //Decription
                    Container(
                    padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                    child:Text(
                      fav.items[index].description,
                      style: kItemDescription,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: CountdownTimer(
                  daysSymbol: new Text("j "),
                  hoursSymbol: new Text(" : "),
                  minSymbol: new Text(" : "),
                  secSymbol: new Text(""),
                  endTime: fav.items[index].countdown,
                  textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  onEnd: () {
              print('onEnd');
            },
                ),
                ),
              ],),
            ),        
          ],
        ),
      ),
    );
  }
}

