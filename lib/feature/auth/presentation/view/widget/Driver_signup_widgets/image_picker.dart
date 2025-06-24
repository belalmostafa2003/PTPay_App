import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onImageSelected;
  const ImagePickerWidget({super.key, required this.onImageSelected});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: _pickImage,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(16),
          dashPattern: [6, 4],
          color: Colors.black,
          strokeWidth: 2,
          child: Container(
            width: 390,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: _selectedImage == null
                ? const Icon(Icons.add_photo_alternate, size: 50, color: Colors.black)
                : ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}