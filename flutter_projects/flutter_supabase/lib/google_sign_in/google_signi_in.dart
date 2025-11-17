import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleSigniIn extends StatelessWidget {
  const GoogleSigniIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future<AuthResponse> _googleSignIn() async {
  ///
  /// Web Client ID that you registered with Google Cloud.
  const webClientId = '322329472127-8m6r07pi02e44it9r5848f3bkc5n03ar.apps.googleusercontent.com';

  ///
  /// iOS Client ID that you registered with Google Cloud.
  const iosClientId = '322329472127-g60f5khfjhbp9r1o0ti1kpvvho6cfbhu.apps.googleusercontent.com';

  // Google sign in on Android will work without providing the Android
  // Client ID registered on Google Cloud.

  final GoogleSignIn signIn = GoogleSignIn.instance;

  // At the start of your app, initialize the GoogleSignIn instance
  unawaited(
    signIn.initialize(clientId: iosClientId, serverClientId: webClientId));

  // Perform the sign in
  final googleAccount = await signIn.authenticate();
  final googleAuthorization = await googleAccount.authorizationClient.authorizationForScopes([]);
  final googleAuthentication = googleAccount!.authentication;
  final idToken = googleAuthentication.idToken;
  final accessToken = googleAuthorization?.accessToken;

  if (idToken == null) {
    throw 'No ID Token found.';
  }

  return Supabase.instance.client.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
}
}
