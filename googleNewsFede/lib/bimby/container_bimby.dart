import 'package:flutter/material.dart';

class ContainerBimby extends StatelessWidget {
  final Widget child;
  final bool padding;
  ContainerBimby(this.child, this.padding);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: padding ? EdgeInsets.all(16) : EdgeInsets.zero,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[200],
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 1.0,
                  spreadRadius: 2.0,
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    1.0, // vertical, move down 10
                  ),
                )
              ],
              borderRadius: new BorderRadius.all(const Radius.circular(0.0)),
            ),
            child: child,
    );
  }
}
