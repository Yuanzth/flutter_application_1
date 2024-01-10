import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'next1.dart';

void main() {
  runApp(MyBirthdayApp());
}

class MyBirthdayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ULTAH ACAAA',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    fakeLoading();
  }

  void fakeLoading() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BirthdayScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Lottie.asset(
              'assets/loading_square.json',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class BirthdayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YEAY HAPPY BIRTHDAY TO ACA!!'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20), // Tambahkan SizedBox di sini
              Text(
                'MET ULTAHHH ACAAA',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Just For Acaaa The One and Only',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Image.asset(
                'assets/birthday_image1.jpg',
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/photo1.jpg',
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 40),
              Text(
                'SELAMAT ULANG TAHUN YANG KE-20 CAAA!!!',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'HIHIHI AKHIRNYA KESAMPEAN YAAA, PLEASE ENJOY THIS APP!!',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Next1Page()),
                  );
                },
                child: Text('GASSS!!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
