import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'dart:ui';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((info) {
      if (mounted) setState(() => _version = info.version);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final versionLabel = _version.isNotEmpty ? 'v$_version' : '';

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
                'Settings & Profile',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final profile = state.userProfile;
          
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 96, left: 20, right: 20, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: VoltColors.surfaceContainerHigh,
                        backgroundImage: profile?.profileImageUrl != null
                            ? NetworkImage(profile!.profileImageUrl!)
                            : null,
                        child: profile?.profileImageUrl == null
                            ? const Icon(Icons.person, color: VoltColors.primary, size: 26)
                            : null,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile?.fullName ?? 'Tesla User',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              profile?.email ?? 'Sign in to see details',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: VoltColors.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: VoltColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, color: VoltColors.primary, size: 16),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                _Label('ANALYTICS'),
                const SizedBox(height: 8),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.analytics, 'Energy Analytics', 'Insights & Health', onTab: () => context.push('/more/analytics')),
                    _SettingsItem(Icons.attach_money, 'Cost Analytics', 'Charging cost & savings', onTab: () => context.push('/more/cost-analytics')),
                    _SettingsItem(Icons.battery_alert, 'Phantom Drain', 'Vampire drain tracking', onTab: () => context.push('/more/drain')),
                  ],
                ),

                const SizedBox(height: 20),

                _Label('HISTORY'),
                const SizedBox(height: 8),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.history, 'Charging History', 'View past sessions', onTab: () => context.push('/more/charging-history')),
                    _SettingsItem(Icons.map, 'Trip History', 'View recorded drives', onTab: () => context.push('/more/trips')),
                    _SettingsItem(Icons.ev_station, 'Nearby Superchargers', 'Find available chargers', onTab: () => context.push('/more/nearby-superchargers')),
                  ],
                ),

                const SizedBox(height: 20),

                _Label('AUTOMATION'),
                const SizedBox(height: 8),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.schedule, 'Automations', 'Scheduled charging & climate', onTab: () => context.push('/more/automations')),
                    _SettingsItem(Icons.build_circle, 'Maintenance', 'Service reminders & tracker', onTab: () => context.push('/more/maintenance')),
                  ],
                ),

                const SizedBox(height: 20),

                _Label('SECURITY & SYSTEM'),
                const SizedBox(height: 8),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.security, 'Security & Privacy', 'FaceID, Key Management', onTab: () => context.push('/more/security')),
                    _SettingsItem(Icons.notifications_none, 'Notifications', 'App & Vehicle alerts', onTab: () => context.push('/more/notifications')),
                    _SettingsItem(Icons.language, 'Units & Language', 'English (US), Imperial'),
                  ],
                ),

                const SizedBox(height: 20),

                _Label('APPLICATION'),
                const SizedBox(height: 8),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.info_outline, 'Software Version', versionLabel),
                    _SettingsItem(Icons.help_outline, 'Help & Support', 'FAQs, Contact us'),
                    _SettingsItem(Icons.feedback, 'Submit Feedback', 'Shape our future'),
                  ],
                ),

                const SizedBox(height: 32),

                Center(
                  child: TextButton.icon(
                    onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
                    icon: const Icon(Icons.logout, size: 16),
                    label: const Text('SIGN OUT', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.5, fontSize: 13)),
                    style: TextButton.styleFrom(
                      foregroundColor: VoltColors.error,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      backgroundColor: VoltColors.error.withOpacity(0.05),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Center(
                  child: Text(
                    _version.isNotEmpty ? 'VOLTRIDE PREMIUM v$_version' : 'VOLTRIDE PREMIUM',
                    style: const TextStyle(color: VoltColors.outline, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final List<_SettingsItem> items;

  const _SettingsCard({required this.items});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final divider = Divider(
      height: 1,
      thickness: 1,
      color: isDark ? Colors.white10 : Colors.black.withOpacity(0.06),
      indent: 52,
      endIndent: 0,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < items.length; i++) ...[
              if (i > 0) divider,
              _SettingsTile(item: items[i], isDark: isDark),
            ],
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final _SettingsItem item;
  final bool isDark;

  const _SettingsTile({required this.item, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTab,
      borderRadius: BorderRadius.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isDark ? VoltColors.backgroundDark : VoltColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(item.icon, color: VoltColors.onSurfaceVariant, size: 17),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, height: 1.2),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      color: VoltColors.onSurfaceVariant,
                      fontSize: 11,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            if (item.onTab != null)
              const Icon(Icons.chevron_right, color: VoltColors.onSurfaceVariant, size: 18),
          ],
        ),
      ),
    );
  }
}

class _SettingsItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTab;

  _SettingsItem(this.icon, this.title, this.subtitle, {this.onTab});
}

class _Label extends StatelessWidget {
  final String label;
  const _Label(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: VoltColors.outline,
      ),
    );
  }
}
