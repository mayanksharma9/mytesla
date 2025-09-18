import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/backend/functions_client.dart';
import 'package:url_launcher/url_launcher.dart';

final functionsProvider = Provider((_) => FunctionsClient());

class LinkTeslaScreen extends ConsumerWidget {
  const LinkTeslaScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: 'Connect your Tesla',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
              'We never store your Tesla password. You authorize via Tesla and we store tokens server‑side only.'),
          const SizedBox(height: 16),
          PrimaryButton(
              label: 'Start Tesla Sign‑In',
              onPressed: () async {
                final fx = ref.read(functionsProvider);
                final res = await fx.beginTeslaOauth();
                final uri = Uri.parse(res['authUrl'] as String);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
// After the user completes OAuth in the browser, your backend will finish linking.
              },
              icon: Icons.link),
        ]),
      ),
    );
  }
}
