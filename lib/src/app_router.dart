import 'package:go_router/go_router.dart';
import 'features/auth/sign_in_screen.dart';
import 'features/home/home_screen.dart';
import 'features/tesla/link_tesla_screen.dart';


final appRouter = GoRouter(
routes: [
GoRoute(path: '/', builder: (_, __) => const SignInScreen()),
GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
GoRoute(path: '/link-tesla', builder: (_, __) => const LinkTeslaScreen()),
],
);