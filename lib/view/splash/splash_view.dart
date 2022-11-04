import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tes_transisi/view/login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<bool> loading() async {
    await Future.delayed(const Duration(seconds: 8)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginView()));
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/mylearning.png",
            width: 200.0,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Let's Start",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          FutureBuilder(
            future: loading(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const SpinKitThreeBounce(
                  color: Color(0xFF6F35A5),
                  size: 50.0,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    ));
  }
}
