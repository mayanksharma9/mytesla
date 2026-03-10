import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../../core/widgets/adaptive/adaptive_button.dart';

class DeveloperSetupPage extends StatefulWidget {
  const DeveloperSetupPage({super.key});

  @override
  State<DeveloperSetupPage> createState() => _DeveloperSetupPageState();
}

class _DeveloperSetupPageState extends State<DeveloperSetupPage> {
  final _clientIdController = TextEditingController();
  final _clientSecretController = TextEditingController();
  String _selectedRegion = 'North America / Asia-Pacific';
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _regions = {
    'North America / Asia-Pacific': 'https://fleet-api.prd.na.vn.cloud.tesla.com',
    'Europe / Middle East / Africa': 'https://fleet-api.prd.eu.vn.cloud.tesla.com',
    'China': 'https://fleet-api.prd.cn.vn.cloud.tesla.cn',
  };

  static const String _redirectUri = 'com.voltride://auth/callback';

  @override
  void dispose() {
    _clientIdController.dispose();
    _clientSecretController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            SaveDeveloperCredentials(
              clientId: _clientIdController.text.trim(),
              clientSecret: _clientSecretController.text.trim(),
              region: _regions[_selectedRegion]!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isDeveloperConfigured && state.status == AuthStatus.initial) {
          context.go('/welcome');
        }
      },
      child: Scaffold(
        backgroundColor: VoltColors.backgroundDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Developer Setup'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 32),
                  _buildGuidanceCard(context),
                  const SizedBox(height: 32),
                  _buildInputFields(context),
                  const SizedBox(height: 48),
                  AdaptiveButton(
                    onPressed: _save,
                    child: const Text(
                      'Save & Continue',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tesla Developer Account',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter your credentials to enable real vehicle authentication.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: VoltColors.textSecondaryDark,
              ),
        ),
      ],
    );
  }

  Widget _buildGuidanceCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStep(
            '1',
            'Go to developer.tesla.com and create an app.',
          ),
          const SizedBox(height: 16),
          _buildStep(
            '2',
            'Use this Redirect URI in your Tesla App configuration:',
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    _redirectUri,
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Courier',
                      fontSize: 13,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 20, color: Colors.white70),
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: _redirectUri));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Redirect URI copied!')),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildStep(
            '3',
            'Copy your Client ID and Client Secret below.',
          ),
        ],
      ),
    );
  }

  Widget _buildStep(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: VoltColors.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          controller: _clientIdController,
          label: 'Client ID',
          hint: 'Paste your Tesla Client ID',
        ),
        const SizedBox(height: 24),
        _buildRegionDropdown(),
        const SizedBox(height: 24),
        _buildTextField(
          controller: _clientSecretController,
          label: 'Client Secret',
          hint: 'Paste your Tesla Client Secret',
          isPassword: true,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
            fillColor: Colors.white.withValues(alpha: 0.05),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: VoltColors.primary, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildRegionDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Region',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedRegion,
              isExpanded: true,
              dropdownColor: VoltColors.surfaceDark,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
              items: _regions.keys.map((String region) {
                return DropdownMenuItem<String>(
                  value: region,
                  child: Text(region),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedRegion = newValue;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
