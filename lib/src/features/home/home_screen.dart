import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/animated_card.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends ConsumerWidget {
const HomeScreen({super.key});
@override
Widget build(BuildContext context, WidgetRef ref) {
return AppScaffold(
title: 'Dashboard',
actions: [IconButton(onPressed: () => context.go('/link-tesla'), icon: const Icon(Icons.electric_car))],
body: GridView.count(
crossAxisCount: MediaQuery.of(context).size.width >= 720 ? 3 : 1,
childAspectRatio: 16/6,
children: const [
AnimatedCard(child: ListTile(title: Text('Vehicle Status'), subtitle: Text('Connect your Tesla to view status'))),
AnimatedCard(child: ListTile(title: Text('Trips'), subtitle: Text('Recent drives & efficiency'))),
AnimatedCard(child: ListTile(title: Text('Charging'), subtitle: Text('Schedule & costs'))),
],
),
);
}
}