
import 'package:dokan/modules/explore/controllers/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplorePage extends GetView<ExploreController> {
  const ExplorePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore'), centerTitle: true,),
      body: const Center(
        child: Text('Explore Page'),
      ),
    );
  }
}
