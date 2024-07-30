import 'package:flutter/material.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';

late List<CameraDescription> cameras;

class YoloVideo extends StatefulWidget {
  const YoloVideo({Key? key}) : super(key: key);

  @override
  State<YoloVideo> createState() => _YoloVideoState();
}

class _YoloVideoState extends State<YoloVideo> {
  late CameraController controller;
  late FlutterVision vision;
  late List<Map<String, dynamic>> yoloResults;
  late FlutterTts tts;
  String previousResult = "";
  DateTime previousSpeechTime = DateTime.now();
  Duration repeatDuration = Duration(seconds: 5); // Set the repeat duration

  CameraImage? cameraImage;
  bool isLoaded = false;
  bool isDetecting = false;
  double confidenceThreshold = 0.5;

  @override
  void initState() {
    super.initState();
    init();
    tts = FlutterTts();
  }

  init() async {
    cameras = await availableCameras();
    vision = FlutterVision();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller.initialize().then((value) {
      loadYoloModel().then((value) {
        setState(() {
          isLoaded = true;
          isDetecting = false;
          yoloResults = [];
        });
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    controller.dispose();
    await vision.closeYoloModel();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; //cihazın ekran boyutu, yönü, çözünürlüğü,
    // metin ölçeklendirme faktörü ve diğer ortam bilgilerini elde etmek

    if (!isLoaded) {
      return const Scaffold(
        body: Center(
          child: Text("Modelin yüklenmesi bekleniyor..."),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(
              controller,
            ),
          ),
          ...displayBoxesAroundRecognizedObjects(size),
          Positioned(
            bottom: 75,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 5, color: Colors.white, style: BorderStyle.solid),
              ),
              child: isDetecting
                  ? IconButton(
                onPressed: () async {
                  stopDetection();
                },
                icon: const Icon(
                  Icons.stop,
                  color: Colors.red,
                ),
                iconSize: 50,
              )
                  : IconButton(
                onPressed: () async {
                  await startDetection();
                },
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                iconSize: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadYoloModel() async {
    await vision.loadYoloModel( //modelin yüklenmesi
        labels: 'assets/labels.txt',
        modelPath: 'assets/yolov8_model.tflite',
        modelVersion: "yolov8",
        numThreads: 1,
        useGpu: true);
    setState(() {
      isLoaded = true;
    });
  }

// Real-time object detection function by yoloOnFrame
  Future<void> yoloOnFrame(CameraImage cameraImage) async {
    final result = await vision.yoloOnFrame(
        bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(), //kamera görüntüsünün düzlemleri (planes) bayt dizilerine dönüştürülür.
        //nesnesinin düzlemlerini (planes) alır ve her düzlemin bayt verilerini (bytes) listeye çevirir. Bu, modelin görüntüyü analiz etmesi için gereklidir.
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        iouThreshold: 0.4,
        confThreshold: 0.4,//Güven eşiği.
        classThreshold: 0.5); //Sınıf eşiği
    if (result.isNotEmpty) {
      setState(() {
        yoloResults = result;
      });
    }
  }

  Future<void> startDetection() async {
    setState(() {
      isDetecting = true;
    });
    if (controller.value.isStreamingImages) {
      return;
    }
    await controller.startImageStream((image) async {
      if (isDetecting) {
        cameraImage = image;
        yoloOnFrame(image);
      }
    });
  }

  Future<void> stopDetection() async {
    setState(() {
      isDetecting = false;
      yoloResults.clear();
    });
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (yoloResults.isEmpty) return [];
    double factorX = screen.width / (cameraImage?.height ?? 1);
    double factorY = screen.height / (cameraImage?.width ?? 1);

    Color colorPick = const Color.fromARGB(255, 50, 233, 30);

    return yoloResults.map((result) {
      double objectX = result["box"][0] * factorX;
      double objectY = result["box"][1] * factorY;
      double objectWidth = (result["box"][2] - result["box"][0]) * factorX;
      double objectHeight = (result["box"][3] - result["box"][1]) * factorY;

      speak() {
        String currentResult = result['tag'].toString();
        DateTime currentTime = DateTime.now();

        if (currentResult != previousResult ||
            currentTime.difference(previousSpeechTime) >= repeatDuration) {
          tts.speak(currentResult);
          previousResult = currentResult;
          previousSpeechTime = currentTime;
        }
      }

      speak();

      return Positioned(
        left: objectX,
        top: objectY,
        width: objectWidth,
        height: objectHeight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100)}",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: const Color.fromARGB(255, 115, 0, 255),
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      home: YoloVideo(),
    ),
  );
}