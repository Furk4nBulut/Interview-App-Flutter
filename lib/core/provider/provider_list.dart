import 'package:flutter/material.dart';
import 'package:interview_app/core/provider/theme_notifier.dart';
import 'package:interview_app/core/service/NavigationService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider  {

  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();


  List<SingleChildWidget> singleItems = [

  ];


  List<SingleChildWidget> dependItems = [
      ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    Provider.value(value: NavigationService.instance),

  ];

  List<SingleChildWidget> uiChangesItems = [

  ];
}