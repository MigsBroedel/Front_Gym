import 'package:flutter/foundation.dart';
class UserProvider with ChangeNotifier {
  var _isAuth = true;

  bool get isAuthenticated => _isAuth;

  String UseriD = "6761d5314c0dd726b523aef6";

  String GetUser () {
    return UseriD;
  }


  // LEMBRA DE PASSAR ESSE USERID PRO LOCAL DO USER E CRIAR UM TODA VEZ QUE O USER CRIAR UMA CONTA
  void login() {
    _isAuth = true;
    notifyListeners();
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }


}
