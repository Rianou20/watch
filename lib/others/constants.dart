//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:flutter/material.dart';

//Colors

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kBlackLight = Color(0xFF212121);
const kWhite = Color(0xFFFFFFFF);
const kLightWhite = Color(0xFFFCFFFC);
const kBlackMedium = Color(0xFF141414);
const kBlackWhite = Color(0xFF999999);

//Padding

const kDefaultPaddin = 20.0;

//Nav
  //black theme
const bSelectedIcon = IconThemeData(color: Colors.white, opacity: 100, size: 35);
const bUnselectedIcon = IconThemeData(color: kBlackWhite, opacity: 100, size: 30.0);
  //light theme
const lSelectedIcon = IconThemeData(color: Colors.black, opacity: 100, size: 35);
const lUnselectedIcon = IconThemeData(color: kBlackLight, opacity: 75, size: 30.0);

//Icons
  //black
const bIcons = IconThemeData(color: Colors.white);
  //light
const lIcons = IconThemeData(color: Colors.black);

//Other

const kAppBarStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 26,);
const kItemTitle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const kItemDescription = TextStyle(fontWeight: FontWeight.normal, fontSize: 16);

//Theme
  //black
const bNavBar = BottomNavigationBarThemeData(
  backgroundColor: kBlackLight, 
  selectedIconTheme: bSelectedIcon,
  unselectedIconTheme: bUnselectedIcon,
  );
  //light
const lNavBar = BottomNavigationBarThemeData(
  backgroundColor: kWhite,
  selectedIconTheme: lSelectedIcon,
  unselectedIconTheme: lUnselectedIcon,
  );