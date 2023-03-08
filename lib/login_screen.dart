import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? text;

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    'Log in',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                      onChanged: (String value) {
                        text = value;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty == true) {
                          return 'please Enter Your name';
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'user name',
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onTap: () {},
                    validator: (String? value) {
                      if (value!.isEmpty == true) {
                        return 'email must not be empty';
                      }
                      if (value.contains('.') == false ||
                          value.contains('@') == false) {
                        return "email must include '.' and '@' sign";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    // onFieldSubmitted: (value){
                    //   print(value);
                    // } ,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your Email',
                        prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value!.length < 6
                          ? "Enter at least 6 character"
                          : null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    // onFieldSubmitted: (value){
                    //   print(value);
                    // } ,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Container(
                    width: 100,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const HomePage();
                          }));
                        }
                      },
                      color: Colors.orange,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
