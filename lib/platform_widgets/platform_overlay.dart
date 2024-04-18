import 'dart:ui';
import 'package:flutter/material.dart';

class CustomOverlay extends StatelessWidget {
  const CustomOverlay({
    required this.close,
    required this.children,
    super.key,
  });
  final List<Widget> children;
  final VoidCallback close;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            GestureDetector(
              onTap: close,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  color: const Color(0x0f221b99),
                ),
              ),
            ),
            for (final child in children) child,
          ],
        ),
      ),
    );
  }
}
