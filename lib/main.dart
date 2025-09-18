import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/app_router.dart';
import 'src/core/theme/app_theme.dart';
import 'src/core/responsive/breakpoints.dart';
import 'firebase_options.dart'; // from FlutterFire CLI


void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
runApp(const ProviderScope(child: TeslaApp()));
}


class TeslaApp extends StatelessWidget {
const TeslaApp({super.key});
@override
Widget build(BuildContext context) {
return LayoutBuilder(
builder: (context, constraints) {
final sizeClass = SizeClass.from(constraints.maxWidth);
return MaterialApp.router(
debugShowCheckedModeBanner: false,
title: 'Tesla Client',
theme: AppTheme.light(sizeClass),
darkTheme: AppTheme.dark(sizeClass),
themeMode: ThemeMode.system,
routerConfig: appRouter,
);
},
);
}
}