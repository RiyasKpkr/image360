import 'package:flutter/material.dart';

class Method1 extends StatefulWidget {
  const Method1({super.key});

  @override
  State<Method1> createState() => _Method1State();
}

class _Method1State extends State<Method1> {
  int currentImageIndex = 0;

  List<String> imageUrls = [
    // Add your image URLs here
    "https://content.helloviewer.io/1920/64e5e39d714d8c78e20c9daa/3280c17b-4d94-47d3-b0fa-5c7cddca7fd8/slot/no_bg/ac07894a-83e5-498e-8dd6-24e467ad61e7/8024-front-removebg-preview.png",
    "https://content.helloviewer.io/1920/a8f2c119-17cc-44ea-ad71-c9e53e9a437d/3c8cc6f9-fea1-4499-ab4f-f668d0fde7f4/slot/no_bg/db93bd3f-b171-4a6c-889c-d2b8c4619cbd/JPEG-20230823-132440-1567832032223492008.jpg",
    "https://content.helloviewer.io/1920/a8f2c119-17cc-44ea-ad71-c9e53e9a437d/11ca5bb5-c40c-4bcf-b678-f8ff328cd1a9/slot/no_bg/4e3417a9-7fc9-41fb-9699-865cdc214789/JPEG-20230823-132426-7723596801867244210.jpg",
    "https://content.helloviewer.io/1920/64e5e39d714d8c78e20c9daa/c83278d5-50f8-401d-8262-0cf20820e694/slot/no_bg/40af3782-86fb-49a4-8222-35f4641e3501/8024-rear-right-removebg-preview.png",
    "https://content.helloviewer.io/1920/64e5e39d714d8c78e20c9daa/eb1dacb4-7e28-48c3-98b4-5d674b1254a7/slot/no_bg/171f2e68-7a70-4c3e-bbaa-1514e294b733/8024-rear-removebg-preview--1-.png",
    "https://content.helloviewer.io/1920/64e5e39d714d8c78e20c9daa/b39e2a7e-1145-4fe0-8b03-f07ceb74503b/slot/no_bg/32630c67-fac6-4daa-84ed-0cb4b1c527ee/8024-rear-left-removebg-preview.png",
    "https://content.helloviewer.io/1920/a8f2c119-17cc-44ea-ad71-c9e53e9a437d/e04084f6-f363-42c0-9357-9bab1dcc9159/slot/no_bg/9eca9f61-e420-4e25-86a0-110066a8d932/JPEG-20230823-132234-2795375049953265483.jpg",

    // Add more image URLs for the 360-degree view
  ];

  void nextImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % imageUrls.length;
    });
  }

  void previousImage() {
    setState(() {
      currentImageIndex = (currentImageIndex - 1 + imageUrls.length) % imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swipe to the right
            previousImage();
          } else if (details.primaryVelocity! < 0) {
            // Swipe to the left
            nextImage();
          }
        },
        child: Center(
          child: Image.network(
            imageUrls[currentImageIndex],
            fit: BoxFit.cover,
            height: 300, // Adjust the height as needed
          ),
        ),
      ),
    );
  }
}
