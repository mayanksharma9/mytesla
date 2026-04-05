import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import '../../../dashboard/presentation/bloc/vehicle_bloc.dart';
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
                ? Colors.black.withOpacity(0.6) 
                : Colors.white.withOpacity(0.8),
              elevation: 0,
              centerTitle: false,
              title: Text(
                'Luxe Mobility',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<VehicleBloc, VehicleBlocState>(
        builder: (context, vehicleState) {
          final vehicle = vehicleState.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, left: 24, right: 24, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SURVEILLANCE CONSOLE',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: VoltColors.onSurfaceVariant,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Security & Sentry',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: vehicle.isSentryModeOn ? VoltColors.error : VoltColors.info,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: (vehicle.isSentryModeOn ? VoltColors.error : VoltColors.info).withOpacity(0.5),
                                blurRadius: 8,
                                spreadRadius: 1,
                              )
                            ]
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          vehicle.isSentryModeOn ? 'SYSTEM ARMED' : 'SENTRY OFF',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: vehicle.isSentryModeOn ? VoltColors.error : VoltColors.info,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Live Feed Area
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDKF7u-oeunWl087g3YWDOHkx3a0wmvsvWb_e5cCshEH6rCLz5tZ6lRHUaVsCf7lVeZuEx_3XzjZy4IdCXuPgOVz9uz4w4tv70-uh6KFv6rZ9HNNiixXqHj7pq2fFG8NBKJsx9x7u0Bk3JFi6oZujE0-2xENB4v3ujiz0vGSs-ZspdbzE-IaLYKS-k_Xr2SCKOeFukEmoV1Fe2Wnl57_iCL29mOC6byIOQqHSOiq2YdHx1UZl0ZGS-D2D120iV2oqPRYW1dQEHU8diQ'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 16,
                        left: 16,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              color: Colors.white.withOpacity(0.2),
                              child: Row(
                                children: [
                                  const Icon(Icons.fiber_manual_record, color: VoltColors.error, size: 12),
                                  const SizedBox(width: 4),
                                  Text(
                                    'LIVE • FRONT CAM',
                                    style: theme.textTheme.labelSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              color: Colors.white.withOpacity(0.2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('DATA UPDATE', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70, fontSize: 8, letterSpacing: 1.5)),
                                  Text(DateFormat('MMM d — HH:mm:ss').format(DateTime.now()).toUpperCase(), style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Multi-Cam Switcher
                Row(
                  children: [
                    Expanded(child: _buildCamThumb('Front', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDvLCH6FgG31wXbBbBFZEATD4ifHObovSiskKM8wa8Ma1CRWGf6xOgT5nQTVcRI62lbWHqvxvqirBDnVDtFMUD5kPd1hvkEFtrgXIL1gN0X_mCH1GxuEMFO9cSc2yoaemEU7Nlz58i9kMULq1petFblUpLssaZp3NgDoaB8jQmdN9QJgdFiH7ONFU3tl7yAvcNEVteDNsTJ9zf-kZ9NMiJDcOF8cZTMQnY-_7-vQ5cZNpuJNqupiD1BRqPEcAFK35zmGxybAttqQh4w', isSelected: true)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildCamThumb('Left Side', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBS_5hLsUE-XkmWLmCFosqTd_7WS1q4yZPDaKh_ySTLxyTTwEScOo5xDHjANquiwn1gs_iQcwelu58LHOPuJoEsHm2s62n86OaW5DJ5MorO6xY8g_FfRF_qcrGK2_p2aJWsA635cqhdpoOPHJjlzybdiytO6aojryqQdXvOeJAxzIRXt-xroTa4XA6IFYCKWvkFhM3AFnKARtQJgzwEaT1tLpOGvwQhvEIGha4xGmdrJfrKkIvFLLH-Lhg5lXUtjSKYckQPyvBSd28N')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildCamThumb('Right Side', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBUZn7MpUjnojR4bxxHzXZ1D4puQOcTwSMnX0oC7GrKlXm2xWUt36Z0ZcpbEOHoo66d0LdFSgW9ozwLLpDUAt10EiJ5y6NPDmXhmpqCPbYhdddd0V7W0uV9tYoRFfW9HVOvYqcHTeCvS46RyGErsAI0aI1G5jefzqUgE6oIK0aLQvOVZ4gwNIavd-NGH6zs_hgKZ3oa0dWJ6RVIe-29AWUO5JTDcMo57WI-VaGN2SvvmuB9df_llzpArRuBNEm1nDEteAs0iw_lE4yS')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildCamThumb('Rear', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDAtZYiEmFzkWPyQ4gtjV47jwn42tWHn7nXyCHOBGrbVxUgxLUBGLOZ3Tx5xmrkD8cyHP6G2XkzUjBk7bqvOWp8YfkslHOFysReKM2PfZv-kZngwXhL4K4CWrJE8mtEeF_G_x_PsoQ3CK_UVGC71nqyD2m3UzBKdlGLzGvqqe82-mDj2l2REKCK2WFBPZscE--vxcjWKMDNcslctFAsjgmLGWpS91wF5CfaElr7uVIq9BiLK3sBAE8CXMaDDXhr5JDQuT75N8YlE0LW')),
                  ],
                ),

                const SizedBox(height: 32),

                // Map & Recent Events 
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('VEHICLE LOCATION', style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('EXPAND MAP', style: theme.textTheme.labelSmall?.copyWith(color: VoltColors.primary, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDygdbodCbv5JC1srEWxEAjEBFNmO2b0-BIJZvJQXDQ_tAmrgFlWfyD8j0WZKhqUmcHGSjWyEZXjqCUm30P9ACSYrObnYmntMm14H7UTpxc7Hw7f9kmi_KVXkfh4kgJJ_2eoxmgJeCW2jhJ7Mx-7s8GOjmZTEHuBbdLIhR-m87RQAwGWvU-dSrskBdAfTW3rCXxNVbKCUXxDaNRzVBJkcVG4A6Xh_cwEgJUjAhdFSmYvCxj2wtIWLwwwkJawOnIs62tPiZvVaw7GBFP'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation)
                          )
                        ),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: VoltColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3)
                            ),
                            child: const Icon(Icons.electric_car, color: Colors.white, size: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: VoltColors.onSurfaceVariant, size: 16),
                          const SizedBox(width: 8),
                          Text(vehicle.state == 'asleep' ? 'Vehicle Hibernating (NYC Area)' : 'Live Tracking Enabled (Manhattan)', style: theme.textTheme.bodyMedium?.copyWith(color: VoltColors.onSurfaceVariant)),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Quick Actions Below
                Row(
                  children: [
                    Expanded(
                      child: _ActionBtn(
                        icon: Icons.lock,
                        label: 'Lock Down',
                        isPrimary: true,
                        isLoading: vehicleState.loadingCommands.contains('${vehicle.id}_lock'),
                        onTap: () => context.read<VehicleBloc>().add(ToggleLock(vehicle.id, true)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _ActionBtn(
                        icon: Icons.notifications_active,
                        label: 'Trigger Alarm',
                        isPrimary: false,
                        isLoading: vehicleState.loadingCommands.contains('${vehicle.id}_horn'),
                        onTap: () => context.read<VehicleBloc>().add(HonkHorn(vehicle.id)),
                        iconColor: VoltColors.error,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _ActionBtn(
                        icon: Icons.flash_on,
                        label: 'Flash Lights',
                        isPrimary: false,
                        isLoading: vehicleState.loadingCommands.contains('${vehicle.id}_flash'),
                        onTap: () => context.read<VehicleBloc>().add(FlashLights(vehicle.id)),
                        iconColor: VoltColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCamThumb(String label, String url, {bool isSelected = false}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: VoltColors.primary, width: 2) : null,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Center(
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;
  final bool isLoading;
  final Color? iconColor;

  const _ActionBtn({
    required this.icon,
    required this.label,
    required this.isPrimary,
    required this.onTap,
    this.isLoading = false,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: isPrimary ? VoltColors.primary : (isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest),
          borderRadius: BorderRadius.circular(32),
          border: isPrimary ? null : Border.all(color: isDark ? Colors.white10 : Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: isPrimary ? Colors.white : VoltColors.primary))
            else
              Icon(icon, color: isPrimary ? Colors.white : (iconColor ?? VoltColors.onSurface)),
            const SizedBox(width: 12),
            Text(
              label,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isPrimary ? Colors.white : VoltColors.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
