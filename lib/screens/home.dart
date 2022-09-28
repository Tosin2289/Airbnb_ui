import 'package:airbnb_ui/widgets/city_widgets.dart';
import 'package:airbnb_ui/widgets/header.dart';
import 'package:airbnb_ui/widgets/live.dart';
import 'package:flutter/material.dart';

import '../widgets/fade_app_bar.dart';
import '../widgets/hero_banner.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  void _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    /// Creating a scroll controller and adding a listener to it.
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              HeroBanner(),
              Header(text: "Explore Nearby"),
              CitiesGrid(),
              Header(text: "Live Anywhere"),
              Live(),
            ],
          ),
          FadeAppBar(scrolloffset: _scrollControllerOffset)
        ],
      ),
    );
  }
}
