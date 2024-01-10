import 'package:flutter/material.dart';
import 'page6.dart';

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;
  late String dynamicText;

  bool isAnimationComplete = false;

  @override
  void initState() {
    super.initState();

    dynamicText = ''; // Inisialisasi dynamicText

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 30000), // Interval diubah menjadi 75ms
    );

    _animation =
        IntTween(begin: 0, end: longText.length).animate(_animationController)
          ..addListener(() {
            setState(() {
              dynamicText = longText.substring(0, _animation.value);
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isAnimationComplete = true;
              });
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String longText = '''
Whoopiee!! Hahaaa gimanaaa? semogaaa acaaa sukaa yaa sama apa yang udah gw buat hihi.

FyI ajahh, ini aplikasi dibuat dengan Bahasa Pemrograman Dart dan Framework Flutter.

Heheee mungkin itu ajaa yaa dari gw inii, semogaa sukaa, oiya next page itu ada page bonus dari gw hahahaha. Yowisss monggo dibuka, abis itu jangan lupa rate nya kasi tau di wa yaaa!!!
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yahh dah abis aja:('),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  dynamicText,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily:
                        'gloriahallelujah', // Ganti dengan font yang diinginkan
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              if (isAnimationComplete)
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page6()),
                    );
                  },
                  child: Text('GAS ABISIN!!'),
                ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
