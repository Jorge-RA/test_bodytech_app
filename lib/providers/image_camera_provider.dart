import 'dart:io';
import 'package:flutter/material.dart';

class ImageCameraProvider extends ChangeNotifier {
  bool _loadImage = false;
  File? _image;
  String? pathImage;

  bool get loadImage => _loadImage;
  set loadImage(bool newValue) {
    _loadImage = newValue;
    notifyListeners();
  }

  set image(String pathImage) {
    this._image = File.fromUri(Uri(path: pathImage));
    _loadImage = true;
    this.pathImage = pathImage;
    notifyListeners();
  }
}
