import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

class Method2 extends StatefulWidget {
  const Method2({super.key});

  @override
  State<Method2> createState() => _Method2State();
}

class _Method2State extends State<Method2> {
  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance.addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          (imagePrecached == true)
              ? ImageView360(
                  key: UniqueKey(),
                  imageList: imageList,
                  // autoRotate: autoRotate,
                  rotationCount: rotationCount,
                  rotationDirection: RotationDirection.anticlockwise,
                  frameChangeDuration: Duration(milliseconds: 30),
                  swipeSensitivity: swipeSensitivity,
                  allowSwipeToRotate: allowSwipeToRotate,
                  onImageIndexChanged: (currentImageIndex) {
                    print("currentImageIndex: $currentImageIndex");
                  },
                )
              : Text("Pre-Caching images..."),
        ],
      ),
    );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 52; i++) {
      imageList.add(AssetImage('assets/sample/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/sample/$i.png'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
}
