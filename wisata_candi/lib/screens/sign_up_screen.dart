import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TODO: Variable Declaration
  final TextEditingController _fullnameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  // TODO: Sign Up Method
  void _signUp() {
    final String name = _fullnameController.text.trim();
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (
      password.length < 8 ||
      !password.contains(RegExp(r'[A-Z]')) ||
      !password.contains(RegExp(r'[a-z]')) ||
      !password.contains(RegExp(r'[0-9]')) ||
      !password.contains(RegExp(r'[!@#\\\$%^&*(),.?":{}|<>]'))
    ) {
      _errorText = 'Minimal 8 karakter. Harus mengandung huruf kapital, huruf kecil, angka numerik, dan simbol.';
    }

    print("SIGN UP SUCCESSFUL");
    print("Name: $name");
    print("Username: $username");
    print("Password: $password");
  }

  // TODO: Dispose Method
  @override
  void dispose() {
    // TODO: implement dispose
    _fullnameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: AppBar
      appBar: AppBar(title: Text('Sign Up'),),
      // TODO: Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                // TODO: MainAxisAlignment and CrossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO: TextFormField - Full Name
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO: TextFormField - Username
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO: TextFormField - Password
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  // TODO: ElevatedButton - Sign In
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      _signUp();
                    },
                    child: Text('Sign Up')
                  ),
                  // TODO: Sign Up Button
                  SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      text: 'Sudah punya akun? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log in di sini.',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {},
                        )
                      ]
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}