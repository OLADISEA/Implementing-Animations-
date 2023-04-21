import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFav = false;
  late Animation  colorAnimation;
  late Animation<double> sizeAnimation;
  late Animation<double> _curve;

  @override
  void initState() {

    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);
    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(_curve);
    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
          tween:Tween<double>(
          begin: 30,end: 50) ,
          weight: 50),
      TweenSequenceItem(
          tween:Tween<double>(
              begin: 50,end: 30) ,
          weight: 50)
    ]).animate(_curve);

    _controller.addListener((){

      print(_controller.value);
    });

    _controller.addStatusListener((status){
      if (status == AnimationStatus.completed){
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed){
        setState(() {
          isFav = false;
        });
      }
    });

  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context,_){
        return IconButton(
            onPressed: () {
              if (isFav){
                _controller.reverse();
              }else{
                _controller.forward();
              }
            },


            icon: Icon(Icons.favorite,
              color: colorAnimation.value,
              size: sizeAnimation.value,));
      },
    );
  }
}
