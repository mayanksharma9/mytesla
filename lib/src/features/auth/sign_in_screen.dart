// lib/src/features/auth/sign_in_screen.dart
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/animated_card.dart';
import '../../core/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';


class SignInScreen extends ConsumerStatefulWidget {
const SignInScreen({super.key});
@override ConsumerState<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends ConsumerState<SignInScreen> {
final _auth = FirebaseAuth.instance;
bool _busy = false;


Future<void> _google() async {
setState(() => _busy = true);
try {
final googleUser = await GoogleSignIn().signIn();
if (googleUser == null) return;
final googleAuth = await googleUser.authentication;
final cred = GoogleAuthProvider.credential(
accessToken: googleAuth.accessToken, idToken: googleAuth.idToken,
);
await _auth.signInWithCredential(cred);
if (mounted) context.go('/home');
} finally { if (mounted) setState(() => _busy = false); }
}


Future<void> _apple() async {
if (!Platform.isIOS) return;
setState(() => _busy = true);
try {
final appleIdCred = await SignInWithApple.getAppleIDCredential(scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName]);
final oauthCred = OAuthProvider('apple.com').credential(idToken: appleIdCred.identityToken, accessToken: appleIdCred.authorizationCode);
await _auth.signInWithCredential(oauthCred);
if (mounted) context.go('/home');
} finally { if (mounted) setState(() => _busy = false); }
}


Future<void> _emailPassword(String email, String password) async {
setState(() => _busy = true);
try {
await _auth.signInWithEmailAndPassword(email: email, password: password);
if (mounted) context.go('/home');
} on FirebaseAuthException catch (e) {
if (e.code == 'user-not-found') {
await _auth.createUserWithEmailAndPassword(email: email, password: password);
if (mounted) context.go('/home');
} else {
if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'Auth error')));
}
} finally { if (mounted) setState(() => _busy = false); }
}


@override
Widget build(BuildContext context) {
return AppScaffold(
title: 'Welcome',
body: Center(
child: ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 480),
child: AnimatedCard(
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(mainAxisSize: MainAxisSize.min, children: [
Text('Sign in', style: Theme.of(context).textTheme.headlineSmall),
const SizedBox(height: 12),
PrimaryButton(label: 'Continue with Google', icon: Icons.login, onPressed: _busy ? null : _google),
const SizedBox(height: 8),
if (Platform.isIOS) PrimaryButton(label: 'Continue with Apple', icon: Icons.apple, onPressed: _busy ? null : _apple),
const SizedBox(height: 8),
_EmailPasswordForm(onSubmit: (e,p)=> _busy? null : _emailPassword(e,p)),
if (_busy) const Padding(padding: EdgeInsets.only(top: 8), child: CircularProgressIndicator()),
]),
),
),
),
),
);
}
}


class _EmailPasswordForm extends StatefulWidget {
final Function(String,String) onSubmit; const _EmailPasswordForm({required this.onSubmit});
@override State<_EmailPasswordForm> createState() => _EmailPasswordFormState();
}
class _EmailPasswordFormState extends State<_EmailPasswordForm> {
final _email = TextEditingController();
final _pass = TextEditingController();
@override void dispose(){ _email.dispose(); _pass.dispose(); super.dispose(); }
@override
Widget build(BuildContext context) => Column(children: [
TextField(controller: _email, decoration: const InputDecoration(labelText: 'Email')),
const SizedBox(height: 8),
TextField(controller: _pass, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
const SizedBox(height: 8),
Align(alignment: Alignment.centerRight, child: PrimaryButton(label: 'Continue', onPressed: ()=> widget.onSubmit(_email.text.trim(), _pass.text)))
]);
}