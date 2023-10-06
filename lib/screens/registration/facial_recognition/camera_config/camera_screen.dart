import 'package:epaymment/screens/registration/proof_of_residency/proof_of_residency.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  bool isFrontCamera = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras.first, ResolutionPreset.max);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();

    if (cameras.isEmpty) {
      // Handle the case when no cameras are available.
      return;
    }

    controller = CameraController(cameras.first, ResolutionPreset.max);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  void toggleCamera() async {
    final newCamera = isFrontCamera
        ? cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.back)
        : cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);

    await controller.dispose();

    controller = CameraController(newCamera, ResolutionPreset.max);
    await controller.initialize();

    setState(() {
      isFrontCamera = !isFrontCamera;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cameras.isEmpty || !controller.value.isInitialized) {
      return const Center(
        child:
            CircularProgressIndicator(), // Display a loading indicator while cameras are initializing.
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        Positioned(
          top: 56,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[700]!,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.close),
                color: Colors.white,
                iconSize: 32,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
        Positioned(
          top: 56,
          right: 16,
          child: GestureDetector(
            onTap: toggleCamera,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[700]!,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child:const  Icon(
                Icons.flip_camera_ios,
                color: Colors.white,
                size: 32,
                
              ),
            ),
          ),
        ),
        Positioned(
          bottom: kBottomNavigationBarHeight,
          left: 0,
          right: 0,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProofOfResidencyWidget()));
                },
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
