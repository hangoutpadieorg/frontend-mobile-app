import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';
import '../../../../../common/constants/general_provider.dart';
import '../../../../controllers/auth_controller.dart';
import '../../booking/component/presentation/booking_page.dart';
import 'presentation/change_password.dart';
import 'presentation/edit_profile.dart';



class DrawerK extends ConsumerWidget {
  const DrawerK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfile()));
                // Navigator.of(context).pushNamed(editProfile);
              },
            ),

            const SizedBox(height: 35,),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.lock, size: 22, color: Colors.black,),
              title: const Text('Change Password'),
              onTap: (){
                // Navigator.of(context).pushNamed(changePassword);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChangePassword()));
              },
            ),

            const SizedBox(height: 35,),

            MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const BookingPage(eventId: '', eventName: '',)));
            }, isSmall: true, isOrange: true),
            const Spacer(),
            BlackButton(label: 'Sign Out', onTap: () async{
              ref.read(loadingProvider.state).state = true;
              final auth = ref.read(authControllerProvider.notifier);
              await auth.logout();
              debugPrint('Successfully logged out');
              ref.read(loadingProvider.state).state = false;
            }, isSmall: true),
            const Spacer(),
            
          ],
        ),
      ),
    );
  }
}


