// Simple stub AuthService for running app without Firebase.
// This simulates success for any non-empty credentials.
class AuthService {
  Future<void> signIn(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (email.isEmpty || password.isEmpty) {
      throw 'Correo y contraseña son requeridos';
    }
    if (!email.contains('@')) {
      throw 'Ingrese un correo válido';
    }
    if (password.length < 6) {
      throw 'La contraseña debe tener al menos 6 caracteres';
    }
    // Simulate success
    return;
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
