import 'package:dokan/app/app.dart';
import 'package:dokan/flavors/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init();

  FlavorConfig(
    flavor: Flavor.DEV,
    name: "Development",
    values: FlavorValues(baseUrl: "https://apptest.dokandemo.com/wp-json/"),
  );

  runApp(const MyApp());
}
