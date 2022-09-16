import 'package:flutter/material.dart';
import 'package:flutter_animations/src/models/layout_model.dart';
import 'package:provider/provider.dart';

import 'package:flutter_animations/src/pages/launcher_page.dart';
import 'package:flutter_animations/src/pages/launcher_tablet_page.dart';
import 'package:flutter_animations/src/theme/theme.dart';

/*void main() {
  runApp(MultiProvider(providers: [
    Provider<ThemeChanger>(create: (_) => ThemeChanger(2)),
    Provider<LayoutModel>(create: (_) => LayoutModel())
  ], child: MyApp()));
}*/

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => LayoutModel(),
      child: ChangeNotifierProvider(
          create: (_) => ThemeChanger(2), child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
        theme: currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'Disenos App',
        //Orientacion del dispositivo
        home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            final screenSize = MediaQuery.of(context).size;

            if (screenSize.width > 500) {
              return LauncherTabletPage();
            } else {
              return LauncherPage();
            }
          },
        ));
  }
}
