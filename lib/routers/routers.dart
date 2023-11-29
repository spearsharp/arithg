import 'package:arithg/others/main_statefultest1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // need to update xcode widget first
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import '../instances/buttonview.dart';
import '../instances/countView.dart';
import '../instances/fadeanimationview.dart';
import '../instances/icons.dart';
import '../instances/gridview.dart';
import '../instances/infraview.dart';
import '../instances/keypage.dart';
import '../instances/listview.dart';
import '../instances/scaleanimationview.dart';
import '../instances/wrapview.dart';
import '../pages/form.dart';
import '../pages/searchPage.dart';
import '../pages/search.dart';
import '../pages/news.dart';
import '../tabs/home.dart';
import '../tabs/home/homeTabPage.dart';
import '../tabs/user/login.dart';
import '../tabs/user/registerFirst.dart';
import '../tabs/user/registerSecond.dart';
import '../tabs/user/registerThird.dart';
import '../utils/tabs.dart';
import '../instances/animatedPlugin/hero.dart';

//depoly route
final Map<String, Function> routes = {
  "/": (context, {arguments}) => const BottomTabs(),
  // "/hometabpage": (contxt, index) => BottomTabs(index: index),
  "/home": (context) => const HomeTabpage(),
  "/iconsInstances": (context, {arguments}) =>
      IconsInstances(arguments: arguments),
  "/countView": (context, {arguments}) => CountView(arguments: arguments),
  "/listView": (context, {arguments}) => ListViewPage(arguments: arguments),
  "/wrapView": (context, {arguments}) => WrapViewPage(arguments: arguments),
  "/hero": (context, {arguments}) => HeroPage(arguments: arguments),
  "/gridView": (context, {arguments}) => GridViewPage(arguments: arguments),
  "/infraView": (context, {arguments}) => InfraViewPage(arguments: arguments),
  "/fadeAnimationView": (context, {arguments}) =>
      FadeAnimationPage(arguments: arguments),
  "/scaleAnimationView": (context, {arguments}) =>
      ScaleAnimationPage(arguments: arguments),
  "/buttonView": (context, {arguments}) => ButtonViewPage(arguments: arguments),
  "/keypageView": (context, {arguments}) => KeyPage(arguments: arguments),
  // "/home": (context) => const HomeTabpage(),
  "/form": (context, {arguments}) => FormPage(arguments: arguments),
  "/news": (context, {arguments}) => NewsPage(arguments: arguments),
  "/login": (context, {arguments}) => LoginPage(arguments: arguments),
  "/registerFirst": (context, {arguments}) =>
      RegisterFirstPage(arguments: arguments),
  "/registerSecond": (context, {arguments}) =>
      RegisterSecondPage(arguments: arguments),
  "/registerThird": (context, {arguments}) =>
      RegisterThirdPage(arguments: arguments),
  "/search": (context, {arguments}) => Search(
        arguments: arguments,
      ),
};

var onGenerateRoute = (RouteSettings settings) {
  print(settings);
  print(settings.name);
  print(settings.arguments);
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    }
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder!(context));
    return route;
  }
  return null;
};
