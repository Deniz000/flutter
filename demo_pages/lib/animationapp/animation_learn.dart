import 'package:flutter/material.dart';

class AnimationLearn extends StatefulWidget {
  const AnimationLearn({super.key});

  @override
  State<AnimationLearn> createState() => _AnimationLearnState();
}

class _AnimationLearnState extends State<AnimationLearn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    _rotationAnimation = Tween(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {
        // Animasyon değeri değiştiğinde yapılacak işlemler
        //içi boşken de değiştikçe çalış, tween ile değişiyor ya
        // Örneğin, güncel animasyon değerini kullanarak başka bir widget'i güncelleme
      });
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Animasyon tamamlandığında yapılacak işlemler
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade900,
                      Colors.yellow.shade100
                    ]),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                   boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4))
                    ]),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.2,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade800,
                      Colors.yellow.shade100
                    ]),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                   boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4))
                    ]),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.4,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade700,
                      Colors.yellow.shade100
                    ]),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4))
                    ]),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.6,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade600,
                      Colors.yellow.shade100
                    ]),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4))
                    ]),
              ),
            ),

            Transform.rotate(
              angle: _rotationAnimation.value + 0.8,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade500,
                      Colors.yellow.shade100
                    ]),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4))
                    ]),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
