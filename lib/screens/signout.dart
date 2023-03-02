import 'package:cybershop/models/userModel.dart';
import 'package:cybershop/repository/userRepository.dart';
import 'package:cybershop/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import 'animation.dart';

class SignOut extends StatefulWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? username;
  String? email;
  String? password;
  String? confirmPassword;

  _registerUser(User user) async {
    // check validation
    if (nameController.text.isEmpty) {
      MotionToast.warning(description: const Text('name is empty'))
          .show(context);
      return;
    }

    if (emailController.text.isEmpty) {
      MotionToast.warning(description: const Text('email is empty'))
          .show(context);
      return;
    }

    if (passwordController.text.isEmpty) {
      MotionToast.warning(description: const Text('password is empty'))
          .show(context);
      return;
    }
    if (passwordController.text.length < 8) {
      MotionToast.warning(description: const Text('password must be 8 Char'))
          .show(context);
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      MotionToast.warning(description: const Text('confirm password is empty'))
          .show(context);
      return;
    }

    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin) {
      Navigator.popAndPushNamed(context, '/signin');
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(msg) {
    if (msg) {
      MotionToast.success(description: const Text('success register'))
          .show(context);
    } else {
      MotionToast.warning(description: const Text('error rergister'))
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 900,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: myHeight * 0.07,
                  width: myWidth,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                ));
                          },
                          child: const Icon(Icons.arrow_back_ios_new_rounded)),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        AnimationWidget(
                          axis: Axis.vertical,
                          curve: Curves.easeOutExpo,
                          offset: 100.0,
                          duration: const Duration(milliseconds: 800),
                          child: Image.asset("assets/image/banner-barber.png"),
                        ),
                        AnimationWidget(
                          axis: Axis.vertical,
                          curve: Curves.easeOutExpo,
                          offset: 100.0,
                          duration: const Duration(milliseconds: 1000),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  key: const ValueKey('txtName'),
                                  controller: nameController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter desired name';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      username = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Full Name",
                                      suffixIcon: Icon(Icons.person_outline),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  key: const ValueKey('txtEmail'),
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Email Address",
                                      suffixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  key: const ValueKey('txtPassword'),
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Password",
                                      suffixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  key: const ValueKey('txtConfirmPassword'),
                                  controller: confirmPasswordController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your confirm password';
                                    }
                                    if (value.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    if (value != password) {
                                      return 'Password not match';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  onChanged: (value) {
                                    setState(() {
                                      confirmPassword = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Confirm Password",
                                      suffixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 14, 230, 42),
                                    minimumSize:
                                        const Size.fromHeight(50), // NEW
                                  ),
                                  key: const ValueKey('btnRegister'),
                                  onPressed: () {
                                    User user = User(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    _registerUser(user);
                                  },
                                  child: const Text("Register"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget orSignIn(String image, int duration) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return AnimationWidget(
      axis: Axis.vertical,
      curve: Curves.easeOutExpo,
      offset: 100.0,
      duration: Duration(milliseconds: duration),
      child: Container(
        height: myHeight * 0.08,
        width: myWidth * 0.16,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Image.asset(image, height: 30.0),
        ),
      ),
    );
  }
}
