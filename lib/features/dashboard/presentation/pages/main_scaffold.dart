import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/volt_colors.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      backgroundColor: VoltColors.backgroundDark,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: VoltColors.backgroundDark.withValues(alpha: 0.95),
          border: const Border(
            top: BorderSide(color: VoltColors.surfaceOverlayDark, width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home, 'Home', 0),
            _buildNavItem(context, Icons.tune, 'Controls', 1),
            _buildNavItem(context, Icons.bolt, 'Charging', 2),
            _buildNavItem(context, Icons.ac_unit, 'Climate', 3),
            _buildNavItem(context, Icons.more_horiz, 'More', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index) {
    final isActive = navigationShell.currentIndex == index;
    return GestureDetector(
      onTap: () => navigationShell.goBranch(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? VoltColors.primary : VoltColors.textTertiaryDark,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? VoltColors.primary : VoltColors.textTertiaryDark,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
