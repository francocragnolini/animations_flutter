import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter_animations/src/widgets/boton_gordo.dart';
import 'package:flutter_animations/src/widgets/headers.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = true;

    if (MediaQuery.of(context).size.height > 550) {
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items.map(
      (item) {
        return FadeInLeft(
          child: BotonGordo(
            onPressed: () {
              print("Hola !!");
            },
            texto: item.texto,
            color1: item.color1,
            color2: item.color2,
            icon: item.icon,
          ),
        );
      },
    ).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 220 : 10),
            child: ListView(children: [
              const SizedBox(
                height: 80,
              ),
              ...itemMap
            ]),
          ),
          if (isLarge) _Encabezado()
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: "Asistencia Medica",
          subtitulo: "Haz solicitado",
          color1: Color(0xff6989F5),
          color2: Color(0xff906EF5),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      texto: "Motor accident",
      icon: FontAwesomeIcons.carBurst,
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
      onPressed: () {
        print("click!!");
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: "Asistencia medica",
      subtitulo: "Haz solicitado",
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
