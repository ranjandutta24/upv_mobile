import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:in.iisco.upv/Screens/overview_page.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/providers/user.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
  // _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  bool _obscureText = true;
  bool loading = false;
  late Map<String, dynamic> jsonMap;
  final _formKey = GlobalKey<FormState>();
  String id = "";
  String password = "";
  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  saveToDB(data) async {
    final db = await getDatabase();

    try {
      db.insert(
        "user_collections",
        {
          'id': json.encode(data['_id']),
          'user_data': json.encode(data),
        },
        conflictAlgorithm:
            ConflictAlgorithm.replace, // or ConflictAlgorithm.ignore
      );
      await db.close();

      Navigator.popUntil(context, (route) => route.isFirst);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OverviewScreen()),
      );
    } catch (e) {
      print("Error: $e");
      // Handle the error or show a custom snackbar
    }
  }

  loginUser() async {
    setState(() {
      loading = true;
    });
    final username = usernameController.text.trim();
    final password = passwordController.text;

    var response = await login(
      json.encode({
        'userid': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
      // print(jsonMap);
      ref.read(userProvider.notifier).saveUser(jsonMap);
      await saveToDB(jsonMap);
      // ignore: use_build_context_synchronously
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (ctx) => const OverviewScreen(
      //         // data: jsonMap,
      //         ),
      //   ),
      // );
      setState(() {
        loading = false;
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Center(
            child: Text('Login Failed, wrong userid or password'),
          ),
          action: SnackBarAction(label: '', onPressed: () {}),
        ),
      );
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // usernameController = TextEditingController(text: "8001470443");
    // passwordController = TextEditingController(text: "0443");
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/OIP.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Login Form
            SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 100),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9), //,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'SAIL-ISP',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Unified Plant View ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    id = value;
                                  });
                                },
                                controller: usernameController,
                                decoration: const InputDecoration(
                                  labelText: 'User ID',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username / Mobile Number is required';
                                  }
                                  // You can add more email validation logic here if needed
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                obscureText: _obscureText,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText =
                                            !_obscureText; // Toggle the value of _obscureText
                                      });
                                    },
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              loading
                                  ? const SizedBox(
                                      height: 35,
                                      child: CircularProgressIndicator(),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      height: 35,
                                      child: ElevatedButton(
                                        //  final username = usernameController.text;
                                        //   final password = passwordController.text;

                                        onPressed: id.trim == "" ||
                                                password.trim() == ""
                                            ? null
                                            : () async {
                                                loginUser();
                                              },
                                        style: ElevatedButton.styleFrom(
                                          //minimumSize: const Size.fromHeight(50),
                                          backgroundColor: const Color.fromARGB(
                                              255, 7, 102, 255),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 20),
                                          child: Text('Login'),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     forgotPassword();
                      //   },
                      //   child: const Text(
                      //     'Forgot Password?',
                      //     style: TextStyle(color: Color(0xff000071)),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void forgotPassword() {}
}
