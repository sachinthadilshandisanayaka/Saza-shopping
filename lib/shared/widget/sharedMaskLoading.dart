import 'package:flutter/material.dart';

class SharedMaskLoading extends StatefulWidget {
  @override
  _SharedMaskLoadingState createState() => _SharedMaskLoadingState();
}

class _SharedMaskLoadingState extends State<SharedMaskLoading>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> animationOne;
  Animation<Color> animationTwo;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationOne = ColorTween(begin: Colors.teal[100], end: Colors.teal[50])
        .animate(controller);
    animationTwo = ColorTween(begin: Colors.teal[50], end: Colors.teal[100])
        .animate(controller);
    controller.forward();

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      } else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }
      this.setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            colors: [animationOne.value, animationTwo.value])
                        .createShader(rect);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.teal[50],
                    ),
                    height: 30,
                    width: 70,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            colors: [animationOne.value, animationTwo.value])
                        .createShader(rect);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.teal[50],
                    ),
                    height: 30,
                    width: 70,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                        colors: [animationOne.value, animationTwo.value])
                    .createShader(rect);
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.teal[50],
                  ),
                  width: double.infinity,
                  height: 280,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
