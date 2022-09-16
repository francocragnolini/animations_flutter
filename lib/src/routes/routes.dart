import 'package:flutter/material.dart';
import 'package:flutter_animations/src/labs/slideshow_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_animations/src/challenges/cuadrado_animado.dart';
import 'package:flutter_animations/src/pages/circular_progess_page.dart';
import 'package:flutter_animations/src/pages/emergency_page.dart';
import 'package:flutter_animations/src/pages/headers_page.dart';
import 'package:flutter_animations/src/pages/pinterest_page.dart';
import 'package:flutter_animations/src/pages/slider_page.dart';

final pageRoutes = [
  _Route(FontAwesomeIcons.slideshare, "SildesShow", SlideShowPage()),
  _Route(FontAwesomeIcons.truckMedical, "Emergencia", EmergencyPage()),
  _Route(FontAwesomeIcons.heading, "Encabezados", HeadersPage()),
  _Route(
      FontAwesomeIcons.peopleCarryBox, "Cuadro Animado", CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, "Circulo Progreso",
      GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, "Pinterest", PinterestPage()),
  _Route(FontAwesomeIcons.mobile, "Slivers", SliderListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
