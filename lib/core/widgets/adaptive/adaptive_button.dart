import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double borderRadius;
  final bool isDestructive;
  final bool isLoading;

  const AdaptiveButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.isDestructive = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ?? (isDestructive ? CupertinoColors.destructiveRed : Theme.of(context).primaryColor),
        onPressed: isLoading ? null : onPressed,
        child: isLoading ? const CupertinoActivityIndicator(color: Colors.white) : child,
      );
    } else {
      return FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? (isDestructive ? Theme.of(context).colorScheme.error : Theme.of(context).primaryColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          minimumSize: const Size.fromHeight(52),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : child,
      );
    }
  }
}
