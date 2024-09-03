import 'package:flutter/material.dart';

const themeColor = Colors.blue;

ThemeData theme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
);
