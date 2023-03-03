import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //------------------------------------------------
  final _formkey = GlobalKey<FormState>();
  var _email = "";
  var _password = "";
  var _username = "";
  bool isLoginPage = false;
  //------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 30.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isLoginPage) //field will visible when loginpage is false
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      key: ValueKey('Username'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Incorrect User Name";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value.toString();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              borderSide: new BorderSide()),
                          labelText: "Enter User Name",
                          labelStyle: GoogleFonts.roboto()),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('email'),
                    validator: (String? value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "Incorrect Email Format";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value.toString();
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide()),
                        labelText: "Enter Email",
                        labelStyle: GoogleFonts.roboto()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    key: ValueKey('password'),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Incorrect Password";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value.toString();
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide()),
                        labelText: "Enter Password",
                        labelStyle: GoogleFonts.roboto()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 70,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: isLoginPage
                            ? Text(
                                "Login",
                                style: GoogleFonts.roboto(fontSize: 28),
                              )
                            : Text(
                                "Sign Up",
                                style: GoogleFonts.roboto(fontSize: 28),
                              ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
