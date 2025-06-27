import 'package:local_auth/local_auth.dart';

class AuthService {
  final _auth = LocalAuthentication();

  Future<bool> hasBiometrics() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print('Biometric error: $e');
      return false;
    }
  }
}
