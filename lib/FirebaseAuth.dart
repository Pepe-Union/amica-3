import 'package:chat_app_example/main.dart';
import 'package:chat_app_example/res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'main.dart';

import 'views/SignUpScreen.dart';

class OtpScreen extends StatefulWidget {
  static const String id = "otpscreen";

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> currentPin = ["", "", "", "", "", "", "", ""];
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
  TextEditingController pin6 = TextEditingController();
  TextEditingController pin7 = TextEditingController();
  TextEditingController pin8 = TextEditingController();
  int pinIndex = 0;
  String strPin;

//  List <String> currentPin=["","","","","","","",""];
  putIndex(String text) {
    if (pinIndex == 0)
      pinIndex = 1;
    else if (pinIndex < 8) pinIndex++;
    setPin(pinIndex, text);
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 8) print(strPin);
  }

  setPin(n, String text) {
    switch (n) {
      case 1:
        pin1.text = text;
        break;
      case 2:
        pin2.text = text;
        break;
      case 3:
        pin3.text = text;
        break;
      case 4:
        pin4.text = text;
        break;
      case 5:
        pin5.text = text;
        break;
      case 6:
        pin6.text = text;
        break;
      case 7:
        pin7.text = text;
        break;
      case 8:
        pin8.text = text;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Log in With Phone number",
                style: TextStyle(
                  letterSpacing: 2,
                  fontFamily: 'Poppins',
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 100, top: 20, left: 20),
              child: Text(
                "Enter OTP",
                style: TextStyle(
                    letterSpacing: 0,
                    fontFamily: 'Poppins1',
                    fontSize: 20,
                    color: Colors.teal),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                " Code has been sent successfully on your phone number +91 $strPin",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 0,
                    fontFamily: 'Poppins1',
                    color: Colors.teal),
              ),
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PINNumber(
                    t1: pin1,
                  ),
                  PINNumber(
                    t1: pin2,
                  ),
                  PINNumber(
                    t1: pin3,
                  ),
                  PINNumber(
                    t1: pin4,
                  ),
                  PINNumber(
                    t1: pin5,
                  ),
                  PINNumber(
                    t1: pin6,
                  ),
                  PINNumber(
                    t1: pin7,
                  ),
                  PINNumber(
                    t1: pin8,
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  "Resend Code",
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Material(
                elevation: 0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Gender.id);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  height: 55.0,
                  minWidth: 320,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  splashColor: Colors.red,
                  color: Colors.redAccent,
                ),
              ),
            ),
            buildNumberPad()
          ],
        ),
      ),
    );
  }

  buildNumberPad() {
    return SafeArea(
      child: Container(
        color: Colors.white10,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    keyBoardNumber(
                        n: 1,
                        onPressed: () {
                          putIndex('1');
                        }),
                    keyBoardNumber(
                        n: 2,
                        onPressed: () {
                          putIndex('2');
                        }),
                    keyBoardNumber(
                        n: 3,
                        onPressed: () {
                          putIndex('3');
                        })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    keyBoardNumber(
                        n: 4,
                        onPressed: () {
                          putIndex('4');
                        }),
                    keyBoardNumber(
                        n: 5,
                        onPressed: () {
                          putIndex('5');
                        }),
                    keyBoardNumber(
                        n: 6,
                        onPressed: () {
                          putIndex('6');
                        })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    keyBoardNumber(
                        n: 7,
                        onPressed: () {
                          putIndex('7');
                        }),
                    keyBoardNumber(
                        n: 8,
                        onPressed: () {
                          putIndex('8');
                        }),
                    keyBoardNumber(
                        n: 9,
                        onPressed: () {
                          putIndex('9');
                        })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('                '),
                      keyBoardNumber(
                          n: 0,
                          onPressed: () {
                            putIndex('0');
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.backspace,
                          ),
                          onPressed: () {})
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController t1;

  const PINNumber({Key key, this.t1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 40,
        child: TextField(
          controller: t1,
          enabled: false,
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2),
              filled: false,
              fillColor: Colors.red),
        ),
      ),
    );
  }
}

class keyBoardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  const keyBoardNumber({Key key, this.n, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white54.withOpacity(0.1)),
        alignment: Alignment.center,
        child: Material(
          elevation: 0,
          child: MaterialButton(
            onPressed: onPressed,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            height: 90.0,
            child: Text(
              "$n",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24 * MediaQuery.of(context).textScaleFactor),
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//
class LoginPage extends StatefulWidget {
  static const String id = 'login';

  @override

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "By tapping log in ,you agree with our teams of"
                  " service and privacy policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 0, fontFamily: 'Poppins1'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Material(
                  elevation: 0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Login.id);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    height: 55.0,
                    minWidth: 320,
                    child: Text(
                      'Log in with email address',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 17),
                    ),
                    splashColor: Colors.red,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text('Or',
                    style: TextStyle(
                      fontFamily: "Poppins2",
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Material(
                  elevation: 0,
                  child: MaterialButton(
                    onPressed: () {
                      //  Navigator.pushNamed(context, OtpScreen1.id);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: 55.0,
                    minWidth: 320,
                    child: Text(
                      'Log in with phone number',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.red,
                          fontSize: 17),
                    ),
                    splashColor: Colors.white,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text('Or',
                    style: TextStyle(
                      fontFamily: "Poppins2",
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      heroTag: "insta",
                      child: Image.asset('assets/images/download.jpeg'),
                      onPressed: () {},
                    ),
                    FloatingActionButton(
                      heroTag: "facebook",
                      backgroundColor: Colors.white,
                      child: Image.asset(
                          'assets/images/facebook-hd-png-facebook-png-hd-png-image-2023.png'),
                      onPressed: () {
                        signUpWithFacebook().whenComplete(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Imformation();
                              },
                            ),
                          );
                        }
                        )
                        ;
                      },
                    ),
                    FloatingActionButton(
                      heroTag: "google",
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/images/download.png'),
                        onPressed: () {
                          signInWithGoogle().whenComplete(() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Imformation();
                                },
                              ),
                            );
                          }
                          )
                          ;
                        },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "We don't post anything to any platform",
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 0, fontFamily: 'Poppins1'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Sign Out");
  }
  Future<void> signUpWithFacebook() async{
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);

      if(result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,

        );
        final FirebaseUser user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        print('signed in ' + user.displayName);
        return user;
      }
    }catch (e) {
      print(e.message);
    }
  }
}

