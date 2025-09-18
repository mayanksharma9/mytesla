import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class AnimatedCard extends StatelessWidget {
final Widget child; final Duration delay;
const AnimatedCard({super.key, required this.child, this.delay = const Duration(milliseconds: 80)});
@override
Widget build(BuildContext context) =>
Card(child: child).animate().fadeIn(duration: 350.ms, delay: delay).slide(begin: const Offset(0, .02), duration: 300.ms);
}
