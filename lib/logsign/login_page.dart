import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todojango/user%20auth/usermodelview.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final Username = TextEditingController();
  // ignore: non_constant_identifier_names
  final Password = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Username.dispose();
    Password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Size size = MediaQuery.of(context).size;
    final auth = Provider.of<UserViewModel>(context);
    bool Loading = auth.Loading;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 52, 52, 52),
        appBar: AppBar(
          title: const Text("LOGIN"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.25),
              SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Email";
                            } else {
                              return null;
                            }
                          },
                          controller: Username,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "E-mail",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 147, 13, 13),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter correct password";
                            } else {
                              return null;
                            }
                          },
                          controller: Password,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 147, 13, 13),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        // height: size.height*0.042,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                
                              auth.signIn(Username.text.toString(),
                                  Password.text.toString(), context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: Loading == true
                                ? const CircularProgressIndicator(
                                  strokeWidth: 1,
                                  strokeCap: StrokeCap.round,
                                  color: Colors.white,
                                )
                                : const Text("Log In")),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('Signin');
                        },
                        child: const Text(
                          "New to the App, Create Account!",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 50,
                color: Colors.white,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          color: Colors.lightBlue.withOpacity(0.5),
                          width: size.width * 0.3,
                          height: size.height * 0.05,
                          child: const Center(
                              child: Text(
                            "LogIn with",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              auth.googleSignIn(context);
                            },
                            child: Image.asset(
                              "assets/pngwing.com.png",
                              height: size.height * 0.1,
                              width: size.width * 0.1,
                              filterQuality: FilterQuality.medium,
                            )),
                        // SizedBox(
                        //   width: size.width * 0.03,
                        // ),
                        // GestureDetector(
                        //     onTap: () {},
                        //     child: Image.asset(
                        //       "assets/facebook.png",
                        //       height: size.height * 0.09,
                        //       width: size.width * 0.09,
                        //       filterQuality: FilterQuality.medium,
                        //     )),
                      ],
                    )),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
