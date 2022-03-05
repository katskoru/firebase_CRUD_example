import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _signUp = false;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                const FlutterLogo(size: 100.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(showPassword
                                ? Icons.visibility_off
                                : Icons.visibility))),
                    controller: _passwordController,
                    obscureText: !showPassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: _signUp ? () {} : () {},
                    child: Text(_signUp ? "Sign Up" : "Log In"),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _signUp = !_signUp;
                      });
                    },
                    child: Text(!_signUp ? "Sign Up" : "Log In"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
