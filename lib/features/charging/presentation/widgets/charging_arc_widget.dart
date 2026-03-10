import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/theme/volt_colors.dart';

class ChargingArcWidget extends StatelessWidget {
  final int level;
  final int limit;
  final bool isCharging;

  const ChargingArcWidget({
    super.key,
    required this.level,
    required this.limit,
    required this.isCharging,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(200, 200),
            painter: ChargingArcPainter(
              level: level / 100,
              limit: limit / 100,
              isCharging: isCharging,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$level%',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'LIMIT: $limit%',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: VoltColors.textTertiaryDark,
                      letterSpacing: 2,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChargingArcPainter extends CustomPainter {
  final double level;
  final double limit;
  final bool isCharging;

  ChargingArcPainter({
    required this.level,
    required this.limit,
    required this.isCharging,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 14.0;

    final basePaint = Paint()
      ..color = VoltColors.surfaceOverlayDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final limitPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.square;

    final progressPaint = Paint()
      ..shader = SweepGradient(
        colors: [
          VoltColors.primary.withValues(alpha: 0.5),
          VoltColors.primary,
        ],
        startAngle: -pi / 2,
        endAngle: pi * 1.5,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, basePaint);

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * level;

    // Draw limit line
    final limitAngle = startAngle + (2 * pi * limit);
    final limitStart = Offset(
      center.dx + (radius - 10) * cos(limitAngle),
      center.dy + (radius - 10) * sin(limitAngle),
    );
    final limitEnd = Offset(
      center.dx + (radius + 10) * cos(limitAngle),
      center.dy + (radius + 10) * sin(limitAngle),
    );
    canvas.drawLine(limitStart, limitEnd, limitPaint);

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
