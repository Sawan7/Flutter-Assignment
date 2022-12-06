import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:projectauth/verifiy_screen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = '';

  var object;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    object = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          alignment: Alignment.center,
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff2F3037),
            size: 26,
          ),
          onPressed: () => Navigator.of(context).pop('Verify'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 112),
        child: Column(
          children: [
            Center(
                child: Text(
              'Verify Phone',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              'code sent to',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xff6A6C7B)),
            ),
            SizedBox(
              height: 24,
            ),
            Pinput(
              onChanged: (value) {
                otpCode = value;
              },
              length: 6,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                    fontSize: 20,
                    // color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xff93D2F3),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(59, 12, 58, 10),
              child: Row(
                children: [
                  Text(
                    "Didn't receive the Code ?",
                    style: TextStyle(color: Color(0xff6A6C7B), fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Request again',
                      style: TextStyle(color: Color(0xff061D28), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 56,
              width: 328,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential phoneauthcredential =
                        PhoneAuthProvider.credential(
                            verificationId: VerifiyScreen.verify!,
                            smsCode: otpCode);

                    await auth.signInWithCredential(phoneauthcredential);
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'Profile', (route) => false);
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: "Wrong OTP",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey[200],
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2E3B62)),
                child: Center(
                  child: Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
