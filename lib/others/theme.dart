//Copyright 2013, Tony Royden, All rights reserved.
//This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

import 'package:flutter/material.dart';
import 'package:chrolix/others/constants.dart';

ThemeData dark = ThemeData(                 
  bottomNavigationBarTheme: bNavBar,
  scaffoldBackgroundColor: kBlackMedium,
  brightness: Brightness.dark,
  iconTheme: bIcons,
);

ThemeData light = ThemeData(
  bottomNavigationBarTheme: lNavBar,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  iconTheme: lIcons,
  primaryColor: kWhite,
);
