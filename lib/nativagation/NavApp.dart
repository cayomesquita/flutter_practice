import 'package:flutter/material.dart';
import 'package:flutter_pactice/nativagation/AppNav.dart';
import 'package:flutter_pactice/nativagation/BottomNav.dart';

class NavApp extends StatefulWidget {
  @override
  _NavAppState createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {
  @override
  Widget build(BuildContext context) {
    return BottomNav();
  }
}
