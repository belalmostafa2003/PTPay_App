import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ProfileHeader extends StatefulWidget {
  final String name;
  final String initialImagePath;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.initialImagePath,
  }) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late String imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = widget.initialImagePath;
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        imagePath = result.files.single.path!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: imagePath.startsWith('assets/')
                  ? AssetImage(imagePath) as ImageProvider
                  : FileImage(File(imagePath)),
            ),
            GestureDetector(
              onTap: _pickImage,
              child: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 16,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          widget.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
