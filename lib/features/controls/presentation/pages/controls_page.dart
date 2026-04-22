import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/dashboard/presentation/pages/home_page.dart' show VirtualKeySheet;
import 'dart:ui';

class ControlsPage extends StatelessWidget {
  const ControlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor: isDark
                  ? Colors.black.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.8),
              elevation: 0,
              centerTitle: true,
              title: Text(
                'VEHICLE COMMANDS',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocConsumer<VehicleBloc, VehicleBlocState>(
        listenWhen: (prev, curr) =>
            curr.commandError != null && curr.commandError != prev.commandError,
        listener: (context, state) {
          final error = state.commandError!;
          if (error == 'VIRTUAL_KEY_NOT_ADDED') {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const VirtualKeySheet(),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                backgroundColor: VoltColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            );
          }
        },
        builder: (context, state) {
          final vehicle = state.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          final bloc = context.read<VehicleBloc>();

          return SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 100,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).padding.bottom + 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Status strip ──────────────────────────────────────────
                _StatusStrip(vehicle: vehicle, isDark: isDark),
                const SizedBox(height: 24),

                // ── Access ────────────────────────────────────────────────
                _SectionLabel('Access'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.lock_rounded,
                        label: 'Lock',
                        active: vehicle.isLocked,
                        loading: state.loadingCommands.contains('${vehicle.id}_lock'),
                        onTap: () => bloc.add(ToggleLock(vehicle.id, true)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.lock_open_rounded,
                        label: 'Unlock',
                        active: !vehicle.isLocked,
                        loading: state.loadingCommands.contains('${vehicle.id}_lock'),
                        onTap: () => bloc.add(ToggleLock(vehicle.id, false)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.file_open_rounded,
                        label: 'Front Trunk',
                        onTap: () => bloc.add(ActuateTrunk(vehicle.id, 'front')),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.inventory_2_rounded,
                        label: 'Rear Trunk',
                        onTap: () => bloc.add(ActuateTrunk(vehicle.id, 'rear')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ── Security ──────────────────────────────────────────────
                _SectionLabel('Security'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.shield_rounded,
                        label: 'Sentry Mode',
                        active: vehicle.isSentryModeOn,
                        loading: state.loadingCommands.contains('${vehicle.id}_sentry'),
                        activeColor: VoltColors.error,
                        onTap: () => bloc.add(ToggleSentryMode(vehicle.id, !vehicle.isSentryModeOn)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.supervisor_account_rounded,
                        label: 'Valet Mode',
                        active: vehicle.isValetModeOn,
                        loading: state.loadingCommands.contains('${vehicle.id}_valet'),
                        onTap: () => bloc.add(ToggleValetMode(vehicle.id, !vehicle.isValetModeOn)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ── Alerts ────────────────────────────────────────────────
                _SectionLabel('Alerts'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.notifications_active_rounded,
                        label: 'Honk Horn',
                        loading: state.loadingCommands.contains('${vehicle.id}_horn'),
                        onTap: () => bloc.add(HonkHorn(vehicle.id)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.flashlight_on_rounded,
                        label: 'Flash Lights',
                        loading: state.loadingCommands.contains('${vehicle.id}_flash'),
                        onTap: () => bloc.add(FlashLights(vehicle.id)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ── Windows ───────────────────────────────────────────────
                _SectionLabel('Windows'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.vertical_align_top_rounded,
                        label: 'Close All',
                        onTap: () => bloc.add(WindowControl(vehicle.id, 'close')),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _CommandTile(
                        icon: Icons.air_rounded,
                        label: 'Vent',
                        onTap: () => bloc.add(WindowControl(vehicle.id, 'vent')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ── Wake ──────────────────────────────────────────────────
                _SectionLabel('Power'),
                const SizedBox(height: 12),
                _CommandTile(
                  icon: Icons.power_settings_new_rounded,
                  label: 'Wake Vehicle',
                  subtitle: vehicle.state == 'online' ? 'Already online' : 'Vehicle is ${vehicle.state}',
                  onTap: vehicle.state == 'online'
                      ? null
                      : () => bloc.add(WakeOnForeground()),
                  fullWidth: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ── Status strip ──────────────────────────────────────────────────────────────

class _StatusStrip extends StatelessWidget {
  final vehicle;
  final bool isDark;
  const _StatusStrip({required this.vehicle, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOnline = vehicle.state == 'online';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: isOnline ? VoltColors.success : VoltColors.onSurfaceVariant,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            vehicle.state.toUpperCase(),
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: isOnline ? VoltColors.success : VoltColors.onSurfaceVariant,
              letterSpacing: 1,
            ),
          ),
          const Spacer(),
          Icon(vehicle.isLocked ? Icons.lock_rounded : Icons.lock_open_rounded,
              size: 16, color: VoltColors.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(
            vehicle.isLocked ? 'Locked' : 'Unlocked',
            style: theme.textTheme.bodySmall?.copyWith(color: VoltColors.onSurfaceVariant),
          ),
          const SizedBox(width: 16),
          if (vehicle.isSentryModeOn) ...[
            const Icon(Icons.shield_rounded, size: 16, color: VoltColors.error),
            const SizedBox(width: 4),
            Text('Sentry',
                style: theme.textTheme.bodySmall?.copyWith(color: VoltColors.error, fontWeight: FontWeight.w600)),
          ],
        ],
      ),
    );
  }
}

// ── Section label ─────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: VoltColors.onSurfaceVariant,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
    );
  }
}

// ── Command tile ──────────────────────────────────────────────────────────────

class _CommandTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final bool active;
  final bool loading;
  final bool fullWidth;
  final Color? activeColor;
  final VoidCallback? onTap;

  const _CommandTile({
    required this.icon,
    required this.label,
    this.subtitle,
    this.active = false,
    this.loading = false,
    this.fullWidth = false,
    this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = activeColor ?? VoltColors.primary;
    final disabled = onTap == null;

    return GestureDetector(
      onTap: (loading || disabled) ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: fullWidth ? double.infinity : null,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: fullWidth ? 16 : 18,
        ),
        decoration: BoxDecoration(
          color: active
              ? color.withValues(alpha: 0.12)
              : (isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: active ? color.withValues(alpha: 0.4) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: fullWidth
            ? Row(
                children: [
                  _iconOrSpinner(color, disabled),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: disabled ? VoltColors.onSurfaceVariant : null,
                          )),
                      if (subtitle != null)
                        Text(subtitle!,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: VoltColors.onSurfaceVariant)),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _iconOrSpinner(active ? color : VoltColors.onSurfaceVariant, disabled),
                  const SizedBox(height: 12),
                  Text(
                    label,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: active ? color : null,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _iconOrSpinner(Color color, bool disabled) {
    if (loading) {
      return SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: color,
        ),
      );
    }
    return Icon(icon, color: disabled ? VoltColors.onSurfaceVariant.withValues(alpha: 0.4) : color, size: 22);
  }
}
