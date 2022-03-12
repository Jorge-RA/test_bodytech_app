import 'dart:io';

import 'package:bodytech_test_app/providers/providers.dart';
import 'package:bodytech_test_app/widgets/showSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class CamaraScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  CamaraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageCameraProvider>(context);
    return Scaffold(
      body: Center(
        child: imageProvider.loadImage
            ? _BuildImage(imageProvider: imageProvider)
            : MaterialButton(
                color: Color.fromARGB(255, 241, 145, 0),
                child: Text('Tomar una foto'),
                onPressed: () async {
                  final XFile? imagePicked =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (imagePicked != null) {
                    imageProvider.image = imagePicked.path;
                  }
                },
              ),
      ),
    );
  }
}

class _BuildImage extends StatelessWidget {
  const _BuildImage({
    Key? key,
    required this.imageProvider,
  }) : super(key: key);

  final ImageCameraProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Image.file(
          File(imageProvider.pathImage!),
          fit: BoxFit.cover,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: const Text('Cancelar'),
                color: const Color.fromARGB(255, 241, 145, 0),
                onPressed: () {
                  imageProvider.loadImage = false;
                },
              ),
              const SizedBox(width: 20),
              MaterialButton(
                child: const Text('Guardar'),
                color: const Color.fromARGB(255, 241, 145, 0),
                onPressed: () async {
                  final directory = await getExternalStorageDirectory();
                  if (directory != null) {
                    File(imageProvider.pathImage!)
                        .copy('${directory.path}/imageName.jpg');
                    showSnackBar(
                      context: context,
                      text:
                          'Imagen guardada en: ${directory.path}/imageName.jpg',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
