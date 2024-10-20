import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void pageControllerTransition(PageController controller,
    {required int pageIndex}) {
  controller.animateToPage(pageIndex,
      duration: 1000.ms, curve: Curves.fastOutSlowIn);
}
