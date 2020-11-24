//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:flutter/foundation.dart';
import 'package:chrolix/models/home_models.dart';

class FavModel extends ChangeNotifier {
  HomeModel _catalog;

  final List<int> _itemIds = [];

  HomeModel get catalog => _catalog;

  set catalog(HomeModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'The catalog $newCatalog does not have one of $_itemIds in it.');
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }
}