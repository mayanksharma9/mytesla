import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/auth/domain/security_repository.dart';
import 'package:voltride/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:voltride/core/utils/injection_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voltride/core/network/tesla_config.dart';
import 'package:go_router/go_router.dart';

class SecuritySetupPage extends StatefulWidget {
  const SecuritySetupPage({super.key});

  @override
  State<SecuritySetupPage> createState() => _SecuritySetupPageState();
}

class _SecuritySetupPageState extends State<SecuritySetupPage> {
  bool _isGenerating = false;
  String? _publicKey;

  @override
  void initState() {
    super.initState();
    _checkKey();
  }

  Future<void> _checkKey() async {
    final hasKey = await sl<SecurityRepository>().hasKeyPair();
    if (hasKey) {
      final key = await sl<SecurityRepository>().getPublicKey();
      setState(() {
        _publicKey = key;
      });
    }
  }

  Future<void> _generateKey() async {
    setState(() => _isGenerating = true);
    try {
      await sl<SecurityRepository>().generateKeyPair();
      await _checkKey();
    } finally {
      setState(() => _isGenerating = false);
    }
  }

  Future<void> _registerKey() async {
    // Deep link pattern for virtual keys: https://www.tesla.com/_ak/YOUR_DOMAIN
    final domain = TeslaConfig.developerDomain;
    final url = 'https://www.tesla.com/_ak/$domain';
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      
      // After launching, we assume the user might have completed it.
      // We show a "I've added the key" button.
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final isRegistered = authState.isVirtualKeyRegistered;

        return Scaffold(
          backgroundColor: VoltColors.backgroundDark,
          appBar: AppBar(
            title: const Text('Security Setup'),
            backgroundColor: VoltColors.backgroundDark,
            elevation: 0,
            leading: isRegistered ? null : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.verified_user_rounded, color: VoltColors.primary, size: 64),
                const SizedBox(height: 24),
                Text(
                  'Final Step: Secure Your Vehicle',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                // --- SIMPLIFIED SINGLE ACTION ---
                if (!isRegistered) ...[
                  const Text(
                    'To enable remote commands (Lock, Awake, etc.), Tesla requires a one-time secure authorization.',
                    style: TextStyle(color: VoltColors.textSecondaryDark, fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  _buildPrimaryButton(
                    onPressed: _registerKey,
                    label: 'Authorize Vehicle Connection',
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const ToggleVirtualKeyStatus(true));
                      },
                      child: const Text(
                        'I have already authorized this device',
                        style: TextStyle(color: VoltColors.primary),
                      ),
                    ),
                  ),
                ] else ...[
                  _buildSuccessCard('Vehicle Connection Authorized'),
                  const SizedBox(height: 32),
                ],

                if (_publicKey != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Public Key (for developer verification):', 
                            style: TextStyle(color: VoltColors.textTertiaryDark, fontSize: 11)),
                          const SizedBox(height: 4),
                          SelectableText(_publicKey!, 
                            style: const TextStyle(color: Colors.white38, fontSize: 10, fontFamily: 'monospace')),
                        ],
                      ),
                    ),
                  ),

                if (isRegistered)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.go('/home?onboarding=true'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: VoltColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text('Finish Setup & Start', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepHeader(int num, String title, bool done) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: done ? VoltColors.success : VoltColors.primary.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: done 
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : Text('$num', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title.toUpperCase(),
          style: TextStyle(
            color: done ? VoltColors.success : Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton({VoidCallback? onPressed, bool isLoading = false, required String label, Color? color, Color? textColor}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? VoltColors.primary,
          foregroundColor: textColor ?? Colors.white,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          disabledBackgroundColor: Colors.white10,
        ),
        child: isLoading 
          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
          : Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSuccessCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: VoltColors.success.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: VoltColors.success.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: VoltColors.success, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: VoltColors.success, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
