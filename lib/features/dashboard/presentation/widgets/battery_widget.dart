import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/theme/volt_colors.dart';

class BatteryWidget extends StatelessWidget {
  final int level;
  final double range;
  final String chargeState;

  const BatteryWidget({
    super.key,
    required this.level,
    required this.range,
    required this.chargeState,
  });

  @override
  Widget build(BuildContext context) {
    final color = level > 50
        ? VoltColors.success
        : (level > 20 ? VoltColors.warning : VoltColors.error);

    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(160, 160),
                painter: BatteryRingPainter(
                  level: level / 100,
                  color: color,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$level%',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${range.toInt()} mi',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: VoltColors.textSecondaryDark,
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          chargeState.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
        ),
      ],
    );
  }
}

class BatteryRingPainter extends CustomPainter {
  final double level;
  final Color color;

  BatteryRingPainter({required this.level, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 10.0;

    final basePaint = Paint()
      ..color = VoltColors.surfaceOverlayDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, basePaint);

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * level;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
