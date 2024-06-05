
import 'package:dokan/modules/explore/controllers/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplorePage extends GetView<ExploreController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore')),
      body: Center(
        child: Text('Explore Page'),
      ),
    );
  }
}
