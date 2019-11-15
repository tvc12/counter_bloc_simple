import 'package:ddi/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/home_page/home_page.dart';
import 'package:flutter_boilerplate/module/module.dart';
import 'package:t_core/config/config.dart';

void main() async {
  final Mode mode = kReleaseMode ? Mode.Production : Mode.Debug;
  final List<Module> modules = kReleaseMode
      ? <Module>[ProdModule() /*ProdModuleCore()*/]
      : <Module>[DevModule() /*DevModuleCore()*/];
  await Config.initAsync(mode);
  await DI.init(modules);

  runApp(_counterApp());
}

Widget _counterApp() {
  return MaterialApp(
    theme: _getTheme(),
    navigatorObservers: <NavigatorObserver>[TNavigatorObserver()],
    routes: <String, WidgetBuilder>{
      '/': (_) => HomePageScreen(),
    },
  );
}

ThemeData _getTheme() {
  return ThemeData(
    fontFamily: "Harmonia",
    primaryColor: Color.fromARGB(255, 252, 108, 133),
  );
}

class TNavigatorObserver extends NavigatorObserver {
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    debugPrint("$runtimeType didPush $route");
  }

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    debugPrint("$runtimeType didPop $route");
  }
}
