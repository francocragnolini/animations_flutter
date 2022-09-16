import 'package:flutter/material.dart';
import 'package:flutter_animations/src/models/layout_model.dart';
import 'package:flutter_animations/src/pages/slideshow_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animations/src/theme/theme.dart';
import 'package:flutter_animations/src/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      backgroundColor: appTheme.currentTheme.accentColor,
      appBar: AppBar(title: Text("Disenos Flutter")),
      drawer: _MenuPrincipal(),
      //body: _ListaOpciones(),
      body: Row(children: [
        Container(
          width: 300,
          height: double.infinity,
          child: _ListaOpciones(),
        ),
        Container(
          width: 1,
          height: double.infinity,
          color: appTheme.darkTheme
              ? Colors.grey
              : appTheme.currentTheme.accentColor,
        ),
        Expanded(child: layoutModel.currentPage)
      ]),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // personalizar los colores
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return Divider(
          color: appTheme.primaryColorLight,
        );
      },
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: FaIcon(
            pageRoutes[index].icon,
            color: appTheme.accentColor,
          ),
          title: Text(pageRoutes[index].titulo),
          trailing: Icon(
            Icons.chevron_right,
            color: appTheme.accentColor,
          ),
          onTap: () {
            final layoutModel =
                Provider.of<LayoutModel>(context, listen: false);
            layoutModel.currentPage = pageRoutes[index].page;

            /*Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return pageRoutes[index].page;
              },
            ));*/
          },
        );
      },
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Configurando el theme de la aplicacion
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: const Text(
                    "FC",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline),
              title: const Text("Dark Mode"),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.darkTheme,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen),
              title: const Text("Custom Theme"),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.customTheme,
                onChanged: (value) {
                  appTheme.customTheme = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
