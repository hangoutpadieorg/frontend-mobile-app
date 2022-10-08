import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';

import 'presentation/change_password.dart';
import 'presentation/edit_profile.dart';



class DrawerK extends StatelessWidget {
  const DrawerK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 25,
        ),
        child: Column(
          children:  [
            Align(alignment: Alignment.topLeft,child: GestureDetector(onTap: (){
              Navigator.pop(context);
            },child: const FaIcon(FontAwesomeIcons.circleXmark, size: 25,)),),
            const SizedBox(height: 45,),
            ListTile(
              leading: const Icon(Icons.location_on_outlined,color: Colors.black, size: 22,),
              title: const Text('Edit Profile'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const EditProfile()));
              },
            ),

            const SizedBox(height: 35,),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.lock, size: 22, color: Colors.black,),
              title: const Text('Change Password'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ChangePassword()));
              },
            ),

            const SizedBox(height: 35,),

            MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){}, isSmall: true, isOrange: true),
            const Spacer(),
            BlackButton(label: 'Sign Out', onTap: (){}, isSmall: true),
            const Spacer(),
            
          ],
        ),
      ),
    );
  }
}


