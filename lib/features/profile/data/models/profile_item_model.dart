import 'package:flutter/material.dart';

class ProfileItemModel {
  final String title;
  final String routeName;
  final IconData icon;

  ProfileItemModel({
    required this.title,
    required this.icon,
    required this.routeName,
  });
}
