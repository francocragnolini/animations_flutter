import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado()),
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

  // Animations
  Animation<double>? moverDerecha;
  Animation<double>? moverArriba;
  Animation<double>? moverIzquierda;
  Animation<double>? moverAbajo;

  @override
  void initState() {
    //inicializar todo.

    //inicializar controller
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    //inicializar propiedades
    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.25, end: -100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    // listener
    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // limpiar el controller : los listeners para evitar fuga de memoria
    //
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward();

    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (context, Widget? child) {
        return Transform.translate(
          offset: Offset(moverDerecha!.value + moverIzquierda!.value,
              moverArriba!.value + moverAbajo!.value),
          child: child,
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
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
