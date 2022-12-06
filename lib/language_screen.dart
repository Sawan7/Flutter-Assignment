import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<String> _lanugages = [
    'ENGLISH',
    'Hindi',
    'Germany',
  ];
  String? _selectedLanguages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 102.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/Vector.png'),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 102.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/Vector-1.png'),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 144.33, 0, 42),
          child: Column(
            children: [
              const Center(
                  child: Image(image: AssetImage('assets/gallery.png'))),
              const SizedBox(height: 34),
              const Text(
                'Please Select Your Language',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.23,
                ),
              ),
              const SizedBox(height: 11.23),
              const Text(
                'You can change the language \n at anytime',
                style: TextStyle(color: Color(0xff6A6C7B)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.51),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72.5),
                child: DropdownButtonFormField(
                  iconSize: 20,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  hint: Text(
                    _lanugages[0].toString(),
                    style: const TextStyle(color: Color(0xff2F3037)),
                  ),
                  value: _selectedLanguages,
                  onChanged: (String? Value) {
                    setState(() {
                      _selectedLanguages = Value;
                    });
                  },
                  items: _lanugages
                      .map((language) => DropdownMenuItem(
                            value: language,
                            child: Text(
                              "$language",
                              style: const TextStyle(
                                  fontSize: 15, color: Color(0xff2F3037)),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 24.5,
              ),
              SizedBox(
                height: 48,
                width: 216,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'phone');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2E3B62)),
                  child: const Center(
                    child: Text(
                      'NEXT',
                      style: TextStyle(),
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
