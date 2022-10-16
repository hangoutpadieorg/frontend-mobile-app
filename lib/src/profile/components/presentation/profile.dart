import 'package:flutter/material.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';
import '../domain/profile_model.dart';
import '../util.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

 ////Modelled profile data
 final ProfileModel data = ProfileModel(id: 1, profileImage: 'assets/images/profile.png', profileName: 'Paul Osho', email: 'paulosho2015@gmail.com', phoneNumber: '+234 9025 2623 15', address: 'Lagos, Nigeria');
class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      drawer: const DrawerK(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 30,
        ),
        child: Column(
          children: [
            const Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 30,),
            CircleAvatar(
              radius: 100,
              child: Image.asset(data.profileImage),///'assets/images/profile.png'
            ),
            const SizedBox(height: 25,),
            Align(
               alignment: Alignment.topLeft,
               child: Text(
                data.profileName,/// ?? 'Paul Osho'
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
                  data.email,//// ?? 'paulosho2015@gmail.com'
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
                 const SizedBox(),
            Align(
              alignment: Alignment.topLeft, child: Text(
              data.phoneNumber,/// ?? '+234 9025 2623 15'
              style: const TextStyle(fontSize: 18, color: Colors.black,
              ),
            ),
            ),
            const SizedBox(),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                  data.address,/// ?? 'Lagos, Nigeria'
                style: const TextStyle(
               fontSize: 18,
               color: Colors.black,
                  ),
                ),
            ),
            const SizedBox(height: 50,),
            MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){}, isSmall: true, isOrange: true),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
