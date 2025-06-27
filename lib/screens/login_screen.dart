import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../services/secure_storage_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final LocalAuthentication auth = LocalAuthentication();
  final SecureStorageService _storageService = SecureStorageService();

  LoginScreen({super.key});

  Future<void> _authenticate(BuildContext context) async {
    bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();

    if (!canAuthenticateWithBiometrics && !isDeviceSupported) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Device authentication not available.')),
      );
      return;
    }

    try {
      bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: false, // ✅ ALLOW PIN, Pattern, or Face ID
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (didAuthenticate) {
        await _storageService.writeToken("secure_token_authenticated");
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication failed.')),
        );
      }
    } catch (e) {
      print("Auth error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secure Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _authenticate(context),
          child: const Text('Login using Device Lock'),
        ),
      ),
    );
  }
}
