import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Form(
                    key: _formGlobalKey,
                    child: Column(children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Image(image: AssetImage('assets/images/logo.png')),
                        const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'UserName'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password'),
                      ),
                        const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            onPressed: () {
                              print(_passwordController.text);
                              print(_usernameController.text);
                              Navigator.pushNamed(context, '/dashboard');

                            },
                            child: const Text("Login")),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            onPressed: () {
                              
                                Navigator.pushNamed(context, '/registerscreen');

                            },
                            child: const Text("Register")),
                      ),
                    ])))));
  }
}
