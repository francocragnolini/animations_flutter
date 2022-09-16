import "package:flutter/material.dart";
import 'package:flutter_animations/src/theme/theme.dart';
import 'package:provider/provider.dart';

class SliderListPage extends StatelessWidget {
  const SliderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: _Titulo()
        //body: _ListaTareas());
        //body: _MainScroll());
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(bottom: -10, right: 0, child: _BotonNewList())
      ],
    ));
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
        minWidth: size.width * 0.9,
        child: RaisedButton(
          onPressed: () {},
          color: appTheme.darkTheme
              ? appTheme.currentTheme.accentColor
              : const Color(0xffED6862),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          child: const Text(
            "creata new list",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', const Color(0xffF08F66)),
    _ListItem('Family', const Color(0xffF2A38A)),
    _ListItem('Subscriptions', const Color(0xffF7CDD5)),
    _ListItem('Books', const Color(0xffFCEBAF)),
    _ListItem('Orange', const Color(0xffF08F66)),
    _ListItem('Family', const Color(0xffF2A38A)),
    _ListItem('Subscriptions', const Color(0xffF7CDD5)),
    _ListItem('Books', const Color(0xffFCEBAF)),
    _ListItem('Orange', const Color(0xffF08F66)),
    _ListItem('Family', const Color(0xffF2A38A)),
    _ListItem('Subscriptions', const Color(0xffF7CDD5)),
    _ListItem('Books', const Color(0xffFCEBAF)),
    _ListItem('Orange', const Color(0xffF08F66)),
    _ListItem('Family', const Color(0xffF2A38A)),
    _ListItem('Subscriptions', const Color(0xffF7CDD5)),
    _ListItem('Books', const Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /*const SliverAppBar(
          backgroundColor: Colors.red,
          title: Text("Hola Mundo"),
          floating: true,
        ),*/
        SliverPersistentHeader(
          delegate: _SilverCustomHeaderDelegate(
              minheight: 170,
              maxheight: 200,
              child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: _Titulo())),
          floating: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SilverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SilverCustomHeaderDelegate(
      {required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SilverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            "New",
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: const Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: const Text(
                "List",
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', const Color(0xffF08F66)),
    _ListItem('Family', const Color(0xffF2A38A)),
    _ListItem('Subscriptions', const Color(0xffF7CDD5)),
    _ListItem('Books', const Color(0xffFCEBAF)),
    _ListItem('Orange', const Color(0xffF08F66)),
    _ListItem('Family', const Color(0xffF2A38A)),
    _ListItem('Subscriptions', const Color(0xffF7CDD5)),
    _ListItem('Books', const Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        });
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
