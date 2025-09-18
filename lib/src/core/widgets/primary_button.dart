import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
final String label; final VoidCallback? onPressed; final IconData? icon;
const PrimaryButton({super.key, required this.label, this.onPressed, this.icon});
@override
Widget build(BuildContext context) {
final btn = FilledButton(onPressed: onPressed, child: Text(label));
return icon == null ? btn : FilledButton.icon(onPressed: onPressed, icon: Icon(icon), label: Text(label));
}
}