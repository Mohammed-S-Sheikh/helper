import 'package:flutter/material.dart';

class OutlinedIcon extends StatelessWidget {
  const OutlinedIcon({
    super.key,
    this.size = 24,
    this.onTap,
    required this.icon,
  });

  final double size;
  final VoidCallback? onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 20,
      width: size + 20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: icon,
      ),
    );
  }
}
