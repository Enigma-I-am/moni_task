import 'package:flutter/material.dart';

class ControllerPageModel {
  const ControllerPageModel({
    required this.page,
    required this.icon,
    required this.name,
  });

  final Widget page;
  final String name;
  final IconData icon;
}
