import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:flutter_animations/src/theme/theme.dart';
import 'package:flutter_animations/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return Scaffold(
        body: HeaderOlas(
      color: accentColor,
    ));
  }
}
