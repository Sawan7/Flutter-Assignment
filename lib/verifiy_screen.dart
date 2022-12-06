import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifiyScreen extends StatefulWidget {
  const VerifiyScreen({Key? key}) : super(key: key);
  static String? verify = '';

  @override
  State<VerifiyScreen> createState() => _VerifiyScreenState();
}

class _VerifiyScreenState extends State<VerifiyScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  static TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            alignment: Alignment.center,
            icon: const Icon(
              Icons.close,
              color: Color(0xff2F3037),
              size: 26,
            ),
            onPressed: () => Navigator.of(context).pop('/'),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 112, 30, 8),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Please enter your mobile number',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "You'll recieve a 6 digit code \n to verify next",
                  style: TextStyle(fontSize: 14, color: Color(0xff6A6C7B)),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 17, 24),
                  child: SizedBox(
                    height: 48,
                    width: 327,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        prefix: Text(
                          '+91   - ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2F3037),
                          ),
                        ),
                        prefixIcon:
                            Image(image: AssetImage('assets/india.png')),
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(
                            color: Color(0xff6A6C7B),
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(16, 14, 8, 14),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 328,
                  child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${_phoneController.text}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          VerifiyScreen.verify = verificationId;
                          Navigator.pushNamed(context, 'Verify');
                        },
                        //   var data = {"VerificationId": verificationId};
                        //   Navigator.pushNamed(context, 'Verify',
                        //       arguments: data);
                        // },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2E3B62)),
                    child: const Center(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
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
}

// Padding(
//   padding: const EdgeInsets.fromLTRB(16, 32, 17, 24),
//   child: TextFormField(
//     controller: _phoneController,
//     keyboardType: TextInputType.phone,
//     decoration: InputDecoration(
//       hintText: 'Enter your Number',
//       prefixIcon: GestureDetector(
//         onTap: () async {
//           final code =
//               await countyPicker.showPicker(context: context);
//           setState(() {
//             countryCode = code;
//           });
//         },
//         child: Row(
//           children: [
//             Container(
//               margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
//               child: countryCode != null
//                   ? countryCode!.flagImage
//                   : null,
//             ),
//             SizedBox(
//               width: 16,
//             ),
//             Container(
//               decoration: BoxDecoration(),
//               child: Text(
//                 countryCode != null
//                     ? countryCode!.dialCode
//                     : '+91' + '  -',
//                 style: const TextStyle(
//                     color: Color(0xff2F3037),
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ],
//         ),
//       ),
//       border: const OutlineInputBorder(),
//     ),
//   ),
// )
