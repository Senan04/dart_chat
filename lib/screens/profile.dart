import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _imageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 300,
      maxHeight: 300,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _imageFile = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(
                width: 80,
                child: Image.asset('assets/images/logo.png'),
              ),
              Text(
                'DartChat',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.grey.shade200,
          onPressed: () => Navigator.of(context).pop(),
          label: Text('Continue'),
          icon: Icon(Icons.keyboard_arrow_right),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                'Set Up Your Profile',
                style: GoogleFonts.cookie(fontSize: 50),
              ),
              const SizedBox(height: 50),
              Neumorphic(
                style: const NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  shape: NeumorphicShape.flat,
                  depth: 10,
                  intensity: 0.86,
                  surfaceIntensity: 0.5,
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey.shade200,
                    foregroundImage:
                        _imageFile != null ? FileImage(_imageFile!) : null,
                    child: Text(
                      'Pick your profile Image',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Neumorphic(
                margin: const EdgeInsets.all(20),
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15.0),
                  ),
                  lightSource: LightSource.topLeft,
                  shape: NeumorphicShape.flat,
                  depth: 18,
                  color: Colors.grey.shade100,
                  shadowLightColor: Colors.white,
                  shadowDarkColor: Colors.grey.shade600,
                  intensity: 0.7,
                  border: const NeumorphicBorder.none(),
                ),
                child: Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0, bottom: 2.0),
                          child: Text(
                            'Username',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(32),
                            ),
                            depth: -8,
                            lightSource: LightSource.topLeft,
                            color: Colors.grey.shade300,
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                            ),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
