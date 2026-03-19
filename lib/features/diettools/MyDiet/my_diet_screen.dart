import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDietScreen extends StatelessWidget {
  const MyDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Premium Diets"),

        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(CupertinoIcons.clear),
        ),
        border: Border.all(
          color: CupertinoColors.systemGrey, // đổi màu viền
          width: 1, // độ dày
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: dietList.length,
          itemBuilder: (context, index) {
            final diet = dietList[index];
            return _buildCard(diet);
          },
        ),
      ),
    );
  }
}

Widget _buildCard(Map<String, String> item) {
  return Container(
    height: 400,
    margin: const EdgeInsets.all(16),
    child: Stack(
      children: [
        // Layer ảnh nền
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(item["image"]!, fit: BoxFit.cover),
          ),
        ),

        Positioned.fill(
          child: ClipRRect(borderRadius: BorderRadius.circular(16)),
        ),
      ],
    ),
  );
}

final List<Map<String, String>> dietList = [
  {
    "title": "CALORIE COUNTING",
    "subtitle": "Time-tested and proven. No food is off-limits",
    "image":
        "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=781&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "title": "Low-Carb",
    "subtitle":
        "Pump up protein and put brakes on carbs to get faster results.",
    "image":
        "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
];
