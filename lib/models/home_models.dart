//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:flutter/material.dart';
import 'package:chrolix/data/data.dart';

class HomeModel {

  Item getById(int id) => itemData[id % itemData.length];

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {

  final String title;
  final String description;
  final String imageURL;
  final int countdown;
  final int id;

//Constructor
  Item({
    this.title,
    this.description,
    this.imageURL,
    this.countdown,
    this.id
  });


  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}