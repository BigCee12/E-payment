import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String text;
  final Function()? onTap;

  const ProfileRow({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
        child: Container(
          width: 500,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 231, 231),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Icon(
                  size: 30,
                  Icons.keyboard_arrow_right_sharp,
                  color: Color.fromARGB(183, 78, 66, 66),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
