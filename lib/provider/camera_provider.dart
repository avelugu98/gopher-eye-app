import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraProvider with ChangeNotifier {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isFlashOn = false;
  bool _isInitialized = false;
  CameraController? get controller => _controller;
  bool get isFlashOn => _isFlashOn;
  bool get isInitialized => _isInitialized;

  XFile? pickedImage;

  Future<void> initializeCameras() async {
    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _controller = CameraController(
        _cameras[0],
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _controller?.initialize();
      _isInitialized = true;
      notifyListeners();
    }
  }

  //* switching camera

  void switchCamera() async {
    if (_cameras.isEmpty) return;

    int currentIndex = _cameras.indexOf(_controller!.description);
    int newIndex = (currentIndex + 1) % _cameras.length;
    _controller = CameraController(
      _cameras[newIndex],
      ResolutionPreset.high,
    );
    await _controller?.initialize();
    notifyListeners();
  }

  //* flash function
  void toggleFlash() {
    _isFlashOn = !_isFlashOn;
    _controller?.setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    notifyListeners();
  }

  //* image capture
  Future<void> capture() async {
    final XFile image = await _controller!.takePicture();
    pickedImage = image;
    notifyListeners();
  }

  Future<void> captureImage() async {
    final picker = ImagePicker();
    pickedImage = await picker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  //* gallery view
  void viewGallery() async {
    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

//*Gallery Image Picker

  Future<void> galleryImage() async {
    final picker = ImagePicker();
    var pickedImages = await picker.pickImage(source: ImageSource.gallery);
    pickedImage = pickedImages;
    notifyListeners();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
