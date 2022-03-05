import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_flutter/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _userController=new TextEditingController();
  TextEditingController _passController=new TextEditingController();
  var _userNameErr="tài khoản không hợp lệ";
  var _passErr="Mật khẩu phải trên 6 kí tự";
  var _userInvaid=false;
  var _passInvaid=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Image.asset('assets/images/login.png',),
              Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
              child: TextField(
                style: TextStyle(fontSize: 18,color: Colors.black),
                controller: _userController,
                decoration: InputDecoration(
                  labelText: "Please Enter user email",
                  errorText: _userInvaid ? _userNameErr :null,
                  prefixIcon: Icon(Icons.person),
                  /*border: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xffCED0D2),
                    width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ) */
                )
              ),
              ),
              TextField(
                style: TextStyle(fontSize: 18,color: Colors.black),
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Please Enter Password",
                  errorText: _passInvaid ? _passErr :null,
                  prefixIcon: Icon(Icons.security),
                  /*border: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xffCED0D2),
                    width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ) */

                ),

              ),
              Container(
                constraints: BoxConstraints.loose(Size(double.infinity,30)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 16,color: Color.fromRGBO(219, 124, 28, 1)),
                  ),
                  ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                
                child: RaisedButton(onPressed: onSignInClicked,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Color.fromARGB(255, 196, 58, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
                  )
              ),)
            ],)),
        ),
      ),
      
    );
  }
  void onSignInClicked()
  {
    setState(() {
      if(_userController.text.length<6||!_userController.text.contains("@"))
      {
        _userInvaid=true;
      }
      else
      {
        _userInvaid=false;
      }

      if(_passController.text.length<6)
      {
        _passInvaid=true;
      }
      else
      {
        _passInvaid=false;
      }
      if(!_userInvaid&& !_passInvaid)
      {
        Navigator.push(context, MaterialPageRoute(builder: gotoHome));
      }
    });
    
  }
  Widget gotoHome(BuildContext context)
  {
    return HomePage();

  }
}