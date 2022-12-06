import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int radioVlaue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 112, 30, 20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Please Select your profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 26),
              Container(
                height: 80,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Radio(
                          value: 2,
                          groupValue: radioVlaue,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              radioVlaue = value!;
                            });
                          }),
                    ),
                    Center(child: Image.asset('assets/Group.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "SHIPPER",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff2F3037)),
                          ),
                          Flexible(
                              child: Text(
                                  " Lorem ipsum dolor sit amet\nconsectetur adipiscing")),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Container(
                height: 80,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Radio(
                          value: 1,
                          groupValue: radioVlaue,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              radioVlaue = value!;
                            });
                            ; //selected value
                          }),
                    ),
                    Center(child: Image.asset('assets/Group.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Transporter",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff2F3037)),
                          ),
                          Container(
                              child: const Text(
                                  " Lorem ipsum dolor sit amet\nconsectetur adipiscing")),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 56,
                width: 328,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Otp');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2E3B62)),
                  child: const Center(
                    child: Text(
                      'CONTINUE',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
