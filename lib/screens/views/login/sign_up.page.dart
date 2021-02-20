import 'package:bau_help_desk/screens/views/login/login_page.dart';
import 'package:bau_help_desk/screens/views/main_screen.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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
          Container(
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height * 0.2)),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Image(
                        image: AssetImage('assets/images/bauglobal_logo.jpg'),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white)),
                        controller: _emailController,
                        validator: (value) => null
                        //!validateEmail(value) ? "Email is Invalid" : null,
                        ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) => value.isEmpty
                          ? "Password is invalid"
                          : value.length < 9
                              ? "Password must contain at least 8 characters"
                              : null,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: "Re-Password",
                          labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                      controller: _confirmPassword,
                      validator: (value){
                        if(value != _passwordController.text)
                          return 'Not match';
                        if(value.isEmpty)
                          return "Password is invalid";
                        return null;
                      }
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
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        onPressed: () => null,
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w800),
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "If you already signed up",
                      style: TextStyle(fontSize: 15, color: Colors.white54),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage())),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
    );
  }

  Future<void> _createAccountOnPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      try {
        var signUpResult = await Amplify.Auth.signUp(
            username: email,
            password: password,
            options: CognitoSignUpOptions(userAttributes: {'email': email}));
        if (signUpResult.isSignUpComplete) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()))
        }
      } on AuthException catch (e) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    }
  }

}
