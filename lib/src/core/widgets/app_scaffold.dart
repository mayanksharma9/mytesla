import 'package:flutter/material.dart';


class AppScaffold extends StatelessWidget {
final String title;
final List<Widget>? actions;
final Widget body;
final Widget? floating;
const AppScaffold({super.key, required this.title, required this.body, this.actions, this.floating});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(title), actions: actions),
body: SafeArea(child: body),
floatingActionButton: floating,
);
}
}