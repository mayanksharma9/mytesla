import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'dart:ui';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

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
            padding: const EdgeInsets.only(top: 100, left: 24, right: 24, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: VoltColors.surfaceContainerHigh,
                        backgroundImage: profile?.profileImageUrl != null
                            ? NetworkImage(profile!.profileImageUrl!)
                            : null,
                        child: profile?.profileImageUrl == null
                            ? const Icon(Icons.person, color: VoltColors.primary, size: 40)
                            : null,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile?.fullName ?? 'Tesla User',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              profile?.email ?? 'Sign in to see details',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: VoltColors.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: VoltColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, color: VoltColors.primary, size: 20),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                _Label('AIRCRAFT & ENERGY'),
                const SizedBox(height: 16),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.analytics, 'Energy Analytics', 'Insights & Health', onTab: () => context.push('/more/analytics')),
                    _SettingsItem(Icons.history, 'Charging History', 'View past sessions', onTab: () => context.push('/more/charging-history')),
                    _SettingsItem(Icons.map, 'Trip History', 'View recorded drives', onTab: () => context.push('/more/trips')),
                    _SettingsItem(Icons.ev_station, 'Charging Guide', 'Optimal practices'),
                  ],
                ),

                const SizedBox(height: 32),

                _Label('SECURITY & SYSTEM'),
                const SizedBox(height: 16),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.security, 'Security & Privacy', 'FaceID, Key Management', onTab: () => context.push('/more/security')),
                    _SettingsItem(Icons.notifications_none, 'Notifications', 'App & Vehicle alerts'),
                    _SettingsItem(Icons.language, 'Units & Language', 'English (US), Imperial'),
                  ],
                ),

                const SizedBox(height: 32),

                _Label('APPLICATION'),
                const SizedBox(height: 16),
                _SettingsCard(
                  items: [
                    _SettingsItem(Icons.info_outline, 'Software Version', 'v1.4.2 (Luxe Build)'),
                    _SettingsItem(Icons.help_outline, 'Help & Support', 'FAQs, Contact us'),
                    _SettingsItem(Icons.feedback, 'Submit Feedback', 'Shape our future'),
                  ],
                ),

                const SizedBox(height: 48),

                Center(
                  child: TextButton.icon(
                    onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
                    icon: const Icon(Icons.logout, size: 18),
                    label: const Text('SIGN OUT', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.5)),
                    style: TextButton.styleFrom(
                      foregroundColor: VoltColors.error,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      backgroundColor: VoltColors.error.withOpacity(0.05),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    'VOLTRIDE PREMIUM v1.4.2',
                    style: TextStyle(color: VoltColors.outline, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
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
    return Container(
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(height: 1, color: isDark ? Colors.white10 : Colors.black12, indent: 64),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDark ? VoltColors.backgroundDark : VoltColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: VoltColors.onSurfaceVariant, size: 20),
            ),
            title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            subtitle: Text(item.subtitle, style: TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12)),
            trailing: Icon(Icons.chevron_right, color: VoltColors.onSurfaceVariant, size: 20),
            onTap: item.onTab,
          );
        },
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
