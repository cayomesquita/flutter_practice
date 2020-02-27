import 'package:flutter/material.dart';

class AppNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.arrow_back)),
              Tab(icon: Icon(Icons.arrow_downward)),
              Tab(icon: Icon(Icons.arrow_forward)),
            ]),
            title: Text("Navigation"),
          ),
          body: TabBarView(children: [
            Icon(Icons.arrow_back),
            Icon(Icons.arrow_downward),
            Icon(Icons.arrow_forward),
          ]),
        ));
  }
}
