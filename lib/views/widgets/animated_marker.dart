import 'package:flutter/material.dart';

class CustomMarker extends StatefulWidget {
  const CustomMarker({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xfffc9f12),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
