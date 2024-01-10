import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/page2.dart';

class Next1Page extends StatefulWidget {
  @override
  _Next1PageState createState() => _Next1PageState();
}

class _Next1PageState extends State<Next1Page>
    with SingleTickerProviderStateMixin {
  late AudioPlayer player;
  bool isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    loadAndPlayAudio();
    startTypingAnimation(); // Panggil startTypingAnimation di initState
  }

  void loadAndPlayAudio() async {
    player.play(AssetSource('music1.wav'));
  }

  void startTypingAnimation() async {
    String longText = '''
Haii acaaa!!
Bagaimana kabar acaaa sejauh inii? gw harap acaa selaluu sehat dan terus semangatt yaa kuliahnyaa. Setelah gw ke Malang sepertinya banyak sekali "our untold story" yaaaaa hahaha tapii gapapa kan kita masih bisa berkabar dan nantii kalau liburan semester kita juga ketemuu. 

Sebelumnyaa gw mintaa maaf bangett kalau jadinya aplikasi ini agak kelewat jauhh yaa dari tanggal ultahh acaaa, soalnya dari kemaren jugaa projekan, terus aplikasi ini banyak bug nyaa wkwk, Alhamdulillah juga aplikasinya jadii yaaa sesuaii janji gw "nanti kalau udah bisa ngoding, gw bikinin yaa" wkwkwk

Kemudian wish-wish gw yang kemaren di wa wkwkwk template bangett yaaa, sekarang gw ulang deh yaa disinii biar lebih kane wkwkwk.

Yaa semogaa acaaa makinnn baikk lagi ke sesama orang, dari temen acaa, sampeee keluargaa acaa. Teruss Kuliahhnyaaa acaaa jugaa semangatttt teruss yaaa, volunteer-an nyaa jugaaa gacorrr terusss, i'm so proud of youu caaa huhu, acaaa hebatt. Semogaaa ultahh yang ke-20 iniii acaaa bisa membukaa lembar baru di hidup acaa.

Semogaa aplikasi yang gw buat ini bisaa membuat mood acaa lebih lebihh lebihh baikk. 

Mungkinnn ituu ajaa yaa, semogaa pas gw di jakarta nantii kita bisaaa main terusss heheheheh, kangenn bangettt cooo.

Yaudaaa ituu ajaaa dulu yaaa, See u in Jakarta caa!!
''';

    for (int i = 0; i < longText.length; i++) {
      await Future.delayed(Duration(milliseconds: 70));
      setState(() {
        dynamicText = longText.substring(0, i + 1);
      });

      if (i == longText.length - 1) {
        await Future.delayed(Duration(milliseconds: 10));
        setState(() {
          isAnimationComplete = true;
        });
      }
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  String dynamicText = ''; // Pindahkan dynamicText ke sini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haaa!? ada longtext?'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: AnimatedTextWidget(
                  dynamicText: dynamicText,
                  onComplete: () {
                    setState(() {
                      isAnimationComplete = true;
                    });
                  },
                ),
              ),
              if (isAnimationComplete)
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page2()),
                    );
                  },
                  child: Text('YUK DILANJUT!'),
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

class AnimatedTextWidget extends StatelessWidget {
  final String dynamicText;
  final VoidCallback onComplete;

  AnimatedTextWidget({required this.dynamicText, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Text(
      dynamicText,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontFamily: 'gloriahallelujah',
      ),
      textAlign: TextAlign.left,
    );
  }
}
