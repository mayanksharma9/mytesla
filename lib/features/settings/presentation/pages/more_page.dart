import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/auth/presentation/bloc/auth_bloc.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoltColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Settings'),
            floating: true,
            backgroundColor: VoltColors.backgroundDark,
            elevation: 0,
          ),
          
          // Profile Header
          SliverToBoxAdapter(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final profile = state.userProfile;
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: VoltColors.surfaceDark,
                        backgroundImage: profile?.profileImageUrl != null
                            ? NetworkImage(profile!.profileImageUrl!)
                            : null,
                        child: profile?.profileImageUrl == null
                            ? const Icon(Icons.person, color: Colors.white, size: 32)
                            : null,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile?.fullName ?? 'Tesla User',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            profile?.email ?? 'Sign in to see details',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: VoltColors.textSecondaryDark,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          _buildSectionHeader('Account'),
          _buildSettingsList([
            _SettingsItem(Icons.history, 'Charging History', 'View past sessions', onTab: (context) {
              context.push('/more/charging-history');
            }),
            _SettingsItem(Icons.info_outline, 'Software', 'v11.1 (2025.44.30)'),
            _SettingsItem(Icons.build_circle_outlined, 'Service', 'Schedule Appointment'),
          ]),

          _buildSectionHeader('Application'),
          _buildSettingsList([
            _SettingsItem(Icons.notifications_none, 'Notifications', 'Enabled'),
            _SettingsItem(Icons.security, 'Security & Privacy', 'FaceID, Signed Commands', onTab: (context) {
              context.push('/more/security');
            }),
            _SettingsItem(Icons.language, 'Units & Language', 'English (US), Imperial'),
            _SettingsItem(Icons.help_outline, 'Help & Support', ''),
          ]),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutRequested());
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: VoltColors.error,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: VoltColors.error, width: 0.5),
                      ),
                    ),
                    child: const Text('Sign Out', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'VoltRide v1.0.0 (Build 124)',
                    style: TextStyle(color: VoltColors.textTertiaryDark, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 32.0, bottom: 8.0),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: VoltColors.textTertiaryDark,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsList(List<_SettingsItem> items) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = items[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: VoltColors.surfaceDark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(item.icon, color: Colors.white, size: 20),
                title: Text(item.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.value.isNotEmpty)
                      Text(item.value, style: const TextStyle(color: VoltColors.textTertiaryDark, fontSize: 13)),
                    const SizedBox(width: 8),
                    const Icon(Icons.chevron_right, color: VoltColors.textTertiaryDark, size: 20),
                  ],
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                onTap: () => item.onTab?.call(context),
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }
}

class _SettingsItem {
  final IconData icon;
  final String title;
  final String value;
  final Function(BuildContext)? onTab;

  _SettingsItem(this.icon, this.title, this.value, {this.onTab});
}
