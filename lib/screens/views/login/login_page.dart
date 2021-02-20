import 'package:bau_help_desk/screens/views/login/sign_up.page.dart';
import 'package:bau_help_desk/screens/views/main_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Stack(
        children: [
          Opacity(
              opacity: 0.9,
              child: Container(
                decoration: BoxDecoration(color: Color(0XFF8B7053)),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/bauglobal_logo.jpg'),
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: Text(
                    'Are You Ready For Erasmus',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  //padding: EdgeInsets.only(bottom: 100),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white)),
                          controller: _emailController,
                          //validator: ,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white)),
                          controller: _passwordController,
                          //validator
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        OutlineButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 3,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            onPressed: () => null,
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 15, color: Colors.white54),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage())),
                            child: Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _loginButtonOnPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      try {
        final signInResult =
            await Amplify.Auth.signIn(username: email, password: password);
        if (signInResult.isSignedIn) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MainScreen()),
          );
        }
      } on AuthException catch (e) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
      //TODO: Login code
    }
  }
}
