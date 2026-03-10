import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final Widget? trailing;
  final List<Widget>? actions;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    this.title,
    this.trailing,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: title != null
            ? CupertinoNavigationBar(
                middle: Text(title!),
                trailing: trailing,
                backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withAlpha(200),
                border: null,
              )
            : null,
        child: SafeArea(child: body),
      );
    } else {
      return Scaffold(
        appBar: title != null
            ? AppBar(
                title: Text(title!),
                actions: actions,
              )
            : null,
        body: SafeArea(child: body),
      );
    }
  }
}
