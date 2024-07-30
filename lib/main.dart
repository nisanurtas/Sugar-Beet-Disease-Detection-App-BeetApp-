//
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'yolo_video.dart'; // Import the YOLO video page
//
// late List<CameraDescription> cameras;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Screen"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const YoloVideo(), // Navigate to YOLO video page
//               ),
//             );
//           },
//           child: const Text("Tespiti Başlat"),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:BeetApp/about_app.dart';
import 'yolo_video.dart';


late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[200], // Set the background color of the AppBar
//         elevation: 0, // Remove the shadow
//
//         title: Text(
//           "BeetApp",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: Image.asset('assets/leaf.png'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/green_bg.jpg'),
//             fit:BoxFit.cover
//           )
//         ),
//         child:  Align(
//           alignment: Alignment.bottomCenter,
//
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const YoloVideo(), // Navigate to YOLO video page
//                 ),
//               );
//             },
//             child: const Text("Başlat"),
//           ),
//         ),
//         SizedBox(height: 16), // Ayırıcı boşluk ekleyebilirsiniz
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: ElevatedButton(
//             onPressed: () {
//               // İkinci butonun onPressed işlevini buraya ekleyin
//             },
//             child: const Text("İkinci Buton"),
//           ),
//         ),
//
//       )
//     );
//   }
// }
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[200],
//         elevation: 0,
//         title: Text(
//           "BeetApp",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: Image.asset('assets/leaf.png'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/green_bg.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const YoloVideo(),
//                     ),
//                   );
//                 },
//                 child: const Text("Başlat"),
//               ),
//             ),
//             SizedBox(height: 32), // Burada bir boşluk ekliyoruz
//             Align(
//             alignment: FractionalOffset(0.5, -0.5),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // İkinci butonun onPressed işlevini buraya ekleyin
//                 },
//                 child: const Text("Uygulama Hakkında"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        title: Text(
          "BeetApp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Image.asset('assets/leaf.png'),
      ),
      body: Stack(

        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/green_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: 150, // İlk butonun yukarıda kalacak mesafe
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const YoloVideo(),
                    ),
                  );
                },
                child: const Text("Başlat"),
              ),
            ),
          ),
          Positioned(
            bottom: 210, // Text'in üstünde kalacak mesafe
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Hoşgeldiniz...",
                style: TextStyle(
                  color: Colors.green.shade300,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70, // İkinci butonun yukarıda kalacak mesafe
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const AboutPage()));
                  // İkinci butonun onPressed işlevini buraya ekleyin
                },
                child: const Text("Uygulama Hakkında"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

