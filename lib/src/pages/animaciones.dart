import 'package:flutter/material.dart';
import "dart:math" as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? rotacion;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;
  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    /*rotacion = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(controller as AnimationController);*/

    /*rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));*/
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(controller!);

    opacidadOut = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 0.25, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    controller?.addListener(() {
      //print("Status: ${controller!.status}");
      if (controller!.status == AnimationStatus.completed) {
        //controller!.reverse();
        controller!.reset();
        //controller!.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //play
    controller?.forward();

    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (context, Widget? childRectangulo) {
        //print("Opacidad: ${opacidad!.value}");
        // print("Rotacion: ${rotacion!.value}");

        return Transform.translate(
          offset: Offset(moverDerecha!.value, 0),
          child: Transform.rotate(
              angle: rotacion!.value,
              child: Opacity(
                opacity: opacidad!.value,
                child: Transform.scale(
                  scale: agrandar!.value,
                  child: childRectangulo,
                ),
              )),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
