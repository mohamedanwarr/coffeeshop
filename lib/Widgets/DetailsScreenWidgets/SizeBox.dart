import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
class SizeCoffee extends StatelessWidget {
  const SizeCoffee({
    super.key,
    required this.size,
    this.sizecup,
    this.color,
    this.backgroundColor,
    this.onTap,
  });

  final String size;
  final double? sizecup;
  final Color? color;
  final dynamic backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 44,
        decoration: ShapeDecoration(
          color: const Color(0xFF3B2C26),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: backgroundColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FlutterIcons.coffee_outline_mco, size: sizecup, color: color),
            const SizedBox(
              width: 5,
            ),
            Text(
              size,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}