import 'dart:io';

import 'package:airbnb_ui/widgets/search.dart';
import 'package:flutter/material.dart';

class FadeAppBar extends StatelessWidget {
  final double scrolloffset;
  const FadeAppBar({Key? key, required this.scrolloffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        child: SafeArea(
          child: Search(),
        ),
        color: Colors.white
            .withOpacity((scrolloffset / 350).clamp(0, 1).toDouble()),
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
    );
  }
}
