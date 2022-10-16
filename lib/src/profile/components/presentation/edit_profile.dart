
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';

import '../domain/profile_model.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, this.validator,  this.onChanged}) : super(key: key);

  final String? Function(File?)? validator;
  final Function(File?)? onChanged;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    final ProfileModel data = ProfileModel(id: 1, profileImage: 'assets/images/profile.png', profileName: 'Paul Osho', email: 'paulosho2015@gmail.com', phoneNumber: '+234 9025 2623 15', address: 'Lagos, Nigeria');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      // drawer: const DrawerK(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 30,
        ),
        child: FormField<File>(
          validator: widget.validator,
          builder: (formFieldSate){
            return Column(
              children: [
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 30,),

                GestureDetector(
                  onTap: (){
                    pickImage();
                  },
                  child: _image != null ? GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(_image!.path),
                      radius: 100,
                    ),
                  ) : const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  'Change Profile Picture',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 25,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    data.profileName,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    data.email,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    data.phoneNumber,
                    style: const TextStyle(fontSize: 18, color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    data.address,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                MyButton(withLogo: false,label: 'UPDATE', onTap: (){
                  upload();
                }, isSmall: true, isOrange: true),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }

/////Upload function
  upload(){
    return const CircularProgressIndicator();
  }
  
  Future pickImage() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    }on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
