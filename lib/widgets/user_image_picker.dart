import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker(
      {super.key, required this.onImageSelect, });

  final void Function(File image) onImageSelect;
  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImage() async {
    final pickedImg = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 100);
    if (pickedImg != null) {
      setState(() {
        _pickedImage = File(pickedImg.path);
      });
    }
    widget.onImageSelect(_pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundImage: _pickedImage != null
                  ? FileImage(_pickedImage!)
                  : null,
        ),
        TextButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: const Text('Add Image'))
      ],
    );
  }
}
