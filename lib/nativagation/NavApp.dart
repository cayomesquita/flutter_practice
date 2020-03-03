import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pactice/nativagation/AppNav.dart';
import 'package:flutter_pactice/nativagation/BottomNav.dart';
import 'package:uni_links/uni_links.dart';

class NavApp extends StatefulWidget {
  @override
  _NavAppState createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {
  String _linkStr;
  StreamSubscription _sub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUniLinks();
  }

  set linkStr(String value) {
    if (value != null) {
      setState(() {
        _linkStr = value;
      });
    }
  }

  Future<Null> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _sub = getLinksStream().listen((String link) {
        linkStr = link;
      }, onError: (err) {
        linkStr = err.toString();
      });
      String initialLink = await getInitialLink();
      linkStr = initialLink;
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
      linkStr = "err";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_linkStr != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Deep Link'),
        ),
        body: Center(
          child: Text(_linkStr),
        ),
      );
    }
    return BottomNav();
  }
}
