
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';

import '../../../../../../common/constants/general_provider.dart';
import '../../../../../../common/widgets/isEmpty.dart';
import '../../../../../controllers/profile_controller.dart';
import '../../../../../models/profile/profile_model.dart';



class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({Key? key, this.validator, }) : super(key: key);
  // static String routeName = "/edit_profile";

  final String? Function(File?)? validator;
  // final Function(File?)? onChanged;

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  File? _image;
  String? _name;
  String? _phone;
  String? _address;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final profileFuture = ref.watch(profileControllerProvider);
    final loading = ref.watch(loadingProvider.state);

    final ProfileModel data = ProfileModel(id: 1.toString(), profileImage: 'assets/images/profile.png', profileName: 'Paul Osho', email: 'paulosho2015@gmail.com', phoneNumber: '+234 9025 2623 15', address: 'Lagos, Nigeria');
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
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  //// profile data from the backend
                  profileFuture.when(
                      data: (profile) => Column(
                        children: [
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
                          _EditTapField(onChanged: (value){
                            setState(() {
                              _name = value;
                            });
                          }, hint: data.profileName, title: 'Name:',),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     data.profileName,
                          //     style: const TextStyle(
                          //       fontSize: 18,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Email: ${data.email}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          const SizedBox(),
                          _EditTapField(onChanged: (value){
                            setState(() {
                              _phone = value;
                            });
                          }, hint: data.phoneNumber, title: 'Phone Number:',),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     data.phoneNumber,
                          //     style: const TextStyle(fontSize: 18, color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(),
                          _EditTapField(onChanged: (value){
                            setState(() {
                              _address = value;
                            });
                          }, hint: data.address, title: 'Address:',),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     data.address,
                          //     style: const TextStyle(
                          //       fontSize: 18,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 50,),
                          MyButton(withLogo: false,label: 'UPDATE', onTap: () async{
                            if(_formKey.currentState!.validate()){
                              loading.state = true;
                              final profileService = ref
                                  .read(profileControllerProvider.notifier);
                              bool? updated =
                              await (profileService.updateProfile(json: {
                                "profileName": _name ?? profile.profileName,
                                "address": _address ?? profile.address,
                                // "profileImage": _image!.path == profile.profileImage,
                                "phone_number": _phone ?? profile.phoneNumber,
                              }));
                              if (updated!) {
                                loading.state = false;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.lightBlue[400],
                                  elevation: 1,
                                  duration: const Duration(seconds: 1),
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                      getProportionateScreenWidth(70.0),
                                      vertical:
                                      getProportionateScreenWidth(20.0)),
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text(
                                    "Profile Is updated successfully",
                                    textAlign: TextAlign.center,
                                  ),
                                ));
                                Navigator.pop(context);
                              } else {
                                loading.state = false;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.lightBlue[400],
                                  elevation: 1,
                                  duration: const Duration(seconds: 1),
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                      getProportionateScreenWidth(70.0),
                                      vertical:
                                      getProportionateScreenWidth(20.0)),
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text(
                                    " Error updating Profile",
                                    textAlign: TextAlign.center,
                                  ),
                                ));
                              }

                            }
                          },
                              isSmall: true, isOrange: true),
                        ],
                      ),
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                  error: (e, st) => Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Center(child: IsEmpty(err: e.toString(),)),
                  ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  
  Future pickImage() async{
    final profileService = ref
        .read(profileControllerProvider.notifier);
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => _image = imageTemp);///this.
      ///Upload the selected image
      profileService.uploadImage(_image!);
    }on PlatformException catch (e) {
      throw('Failed to pick image: $e');
    }
  }
}


class _EditTapField extends StatelessWidget {
  const _EditTapField({Key? key, required this.onChanged, required this.hint, required this.title}) : super(key: key);
  final Function(String)? onChanged;
  final String? hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(500),
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                // border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
