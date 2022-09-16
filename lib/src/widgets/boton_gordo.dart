import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;
  final String texto;
  final VoidCallback? onPressed;

  const BotonGordo(
      {this.icon = FontAwesomeIcons.circle,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      required this.onPressed,
      required this.texto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _BotonGordoBackground(
            icon: icon,
            color1: color1,
            color2: color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(texto,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}

// BACLGROUND DEL BOTON
class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground(
      {required this.icon, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 6),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          color1,
          color2,
        ]),
      ),
      // para cortar la imagen que sobresale del boton
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned(
            top: -20,
            right: -20,
            child: FaIcon(
              icon,
              size: 150,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ]),
      ),
    );
  }
}
