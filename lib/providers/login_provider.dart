import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:wsm_mobile_app/models/login_model.dart';
import 'package:wsm_mobile_app/services/login_service.dart';

class LoginProvider extends ChangeNotifier {
  // Fields
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = '';

  // Services
  final LoginService loginService = LoginService();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  // Getters
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;

  // Setters
  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  // Functions
  Future<void> handleLogin(BuildContext context) async {
    if (_email.isEmpty || _password.isEmpty) {
      _isError = true;
      _errorMessage = "Please Input all field";
      notifyListeners();
      return;
    }
    _isLoading = true;
    notifyListeners();

    try {
      String token = await loginService.login(
        LoginRequest(email: _email, password: _password),
      );
      await storage.write(key: 'token', value: token);
      if (context.mounted) {
        context.go('/');
      }
    } catch (e) {
      _isError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
