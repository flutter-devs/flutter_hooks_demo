import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class HookScroller extends Hook<ScrollController> {
  AnimationController controller;
  HookScroller(this.controller);
  @override
  _HookScrollerState createState() => _HookScrollerState();
}

class _HookScrollerState extends HookState<ScrollController,HookScroller> {
  ScrollController scroller;

  void scrollAnimation(AnimationController controler, ScrollController scrollController) {
    if(scrollController.position.userScrollDirection == ScrollDirection.forward) {
      controler.forward();
    }
    else if(scrollController.position.userScrollDirection == ScrollDirection.reverse){
      controler.reverse();
    }
    else {
      print("not scrolling rn");
    }
  }

  @override
  void initHook() {
    // TODO: implement initHook
    super.initHook();
    scroller = ScrollController()..addListener((){
      scrollAnimation(hook.controller, scroller);
    });
  }

  @override
  ScrollController build(BuildContext context) {
    return scroller;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scroller.dispose();
  }
}

ScrollController scrollController(AnimationController controller) {
  return Hook.use(HookScroller(controller));
}

