import 'package:flutter/material.dart';
import '../../../../core/theme/volt_colors.dart';

class SeatHeaterButton extends StatelessWidget {
  final int level; // 0, 1, 2, 3
  final VoidCallback onTap;
  final bool isRightSide;

  const SeatHeaterButton({
    super.key,
    required this.level,
    required this.onTap,
    this.isRightSide = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = level > 0 ? VoltColors.primary : VoltColors.textTertiaryDark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: VoltColors.surfaceDark,
          borderRadius: BorderRadius.circular(16),
          border: level > 0 ? Border.all(color: VoltColors.primary.withValues(alpha: 0.5)) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_seat,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  width: 8,
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: index < level ? VoltColors.primary : VoltColors.surfaceOverlayDark,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
