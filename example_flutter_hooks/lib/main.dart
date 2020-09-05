import 'package:exampleflutterhooks/customScroll.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'customScroll.dart';

void main()=>runApp(MaterialApp(
  title: "Hooks",
  home: Home(),
  debugShowCheckedModeBanner: false,
));

//




class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
     final hookAnimation = useAnimationController(duration: Duration(milliseconds: 500), initialValue: 0);
     final hookScroll = scrollController(hookAnimation);

     return Scaffold(
      body: GestureDetector(
        onTap: () {
          hookAnimation.reverse();
        },
        onDoubleTap: () {
          hookAnimation.forward();
        },
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            controller: hookScroll,
            children: List.generate(20, (index) {
              return Container(margin: EdgeInsets.all(20),decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                  style: BorderStyle.solid
                )
              ),child: Center(child: FadeTransition(opacity: hookAnimation,child: ScaleTransition(scale: hookAnimation,child: FlutterLogo(colors: Colors.blue,size: 500,)))));
            })
          )

        ),
      ),
    );
  }



}


//
//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
//  AnimationController animationController;
//  Animation<double> animation;
//  ScrollController scroller;
//
//
//  @override
//  void initState() {
//    super.initState();
//
//    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1000),value: 1);
//    scroller = ScrollController()..addListener(
//        () {
//          if(scroller.position.userScrollDirection ==ScrollDirection.forward) {
//            animationController.forward();
//          }
//          else if(scroller.position.userScrollDirection ==ScrollDirection.reverse) {
//            animationController.reverse();
//          }
//          else {
//            print("not scrolloing");
//          }
//        }
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        color: Colors.blueGrey,
//        child: ListView(
//          controller: scroller,
//          children: List.generate(20, (index) {
//            return Container(
//              margin: EdgeInsets.all(10),
//              decoration: BoxDecoration(
//                border: Border.all(
//                  color: Colors.white,
//                  width: 10
//                )
//              ),
//              child: GestureDetector(
//                child: FadeTransition(opacity: animationController,child: Center(child: FlutterLogo(size: 300,))),
//                onTap: animationController.forward,
//                onDoubleTap: animationController.reverse,
//              ),
//            );
//          }),
//        )
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    animationController.dispose();
//    scroller.dispose();
//  }
//
//
//}
