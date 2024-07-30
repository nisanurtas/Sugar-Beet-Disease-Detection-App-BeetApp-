import 'package:flutter/material.dart';



class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        title: const Text(
          "BeetApp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Image.asset('assets/leaf.png'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "BeetApp Hakkında Bilgi",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade200
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "BeetApp, şeker pancarlarında rust hastalığı tespiti uygulamasıdır. Lisans Bitirme Projesi olarak hazırlanmıştır.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15
              ),
            ),
            const SizedBox(height: 20),
             Text(
              "Nisa Nur TAŞ",
              style: TextStyle(
                color: Colors.purple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
                "İletişim: nisaanurtas@gmail.com",
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,

                ),
            )
          ],
        ),
      ),
    );
  }
}
