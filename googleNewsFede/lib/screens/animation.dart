import 'package:flutter/material.dart';

class AnimationsTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationsTestState();
  }
}

class AnimationsTestState extends State<AnimationsTest>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  bool pressed = false;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: -0.35, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              _controller.reverse();
            else if (status == AnimationStatus.dismissed) _controller.forward();
          });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Transform(
            transform: Matrix4.translationValues(
                animation.value * width, animation.value * height, 0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    pressed = !pressed;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: pressed ? 100 : 300,
                  height: pressed ? 100:300,
                  color: Colors.blueAccent,
                ),
              ),
            ));
      },
    );
  }
}
