import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/bloc/auth_bloc.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../../core/widgets/adaptive/adaptive_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error && state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF000000),
                VoltColors.backgroundDark,
                Color(0xFF0F0002),
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    // App Title with premium spacing
                    Text(
                      'VOLTRIDE',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Colors.white,
                            letterSpacing: 12,
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                          ),
                    ),
                    const SizedBox(height: 100),
                    // Hero Text
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.white, Colors.white70],
                      ).createShader(bounds),
                      child: Text(
                        'Your Tesla,\nfully in your pocket',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Experience the next generation of\nvehicle management.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: VoltColors.textSecondaryDark.withOpacity(0.8),
                            letterSpacing: 0.5,
                          ),
                    ),
                    const SizedBox(height: 120),
                    // Sign in Button (Tesla Themed with Glow)
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: VoltColors.primary.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('WelcomePage: Sign in with Tesla button tapped');
                              context.read<AuthBloc>().add(LoginRequested());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: VoltColors.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0, // Handled by container
                            ),
                            child: state.status == AuthStatus.loading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  'Sign in with Tesla',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    // Footer link
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        'Privacy & Legal Policies',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
