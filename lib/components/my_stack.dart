import 'package:flutter/material.dart';

class MyStack extends StatefulWidget {
  const MyStack({super.key});

  @override
  State<MyStack> createState() => _MyStackState();
}

class _MyStackState extends State<MyStack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey,
      ),
      child: Stack(
        children: [
          const Row(),
          Positioned(
            left: 0,
            top:20.0,
            bottom:20.0,

            child:Container(color:Colors.white, child: const Column(children: [],)))
        ],
      ),
    );
  }
}