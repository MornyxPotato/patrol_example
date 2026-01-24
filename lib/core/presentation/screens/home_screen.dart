import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_example/core/presentation/controllers/home_controller.dart';
import 'package:patrol_example/core/style.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          'Patrol Example',
          style: TextStyle(
            color: AppColors.textOrIconColor,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.textOrIconColor),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              child: TextButton(
                key: const Key('HomeCypherButton'),
                onPressed: () {
                  controller.goToCypherScreen();
                },
                child: Text(
                  'Cypher',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textOrIconColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
