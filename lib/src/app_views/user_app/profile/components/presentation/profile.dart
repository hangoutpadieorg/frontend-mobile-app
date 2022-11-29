import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';

import '../../../../../../common/widgets/isEmpty.dart';
import '../../../../../controllers/profile_controller.dart';
// import '../../../../../models/profile/profile_model.dart';
import '../util.dart';

class MyProfile extends ConsumerWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileFuture = ref.watch(profileControllerProvider);
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
            profileFuture.when(
                data: (data) => Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      child: data.profileImage!.isNotEmpty ? Image.asset(data.profileImage!) :
                      Image.asset('assets/images/empty_profile.png'),///'assets/images/profile.png'
                    ),
                    const SizedBox(height: 25,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Name: ${data.profileName}',/// ?? 'Paul Osho'
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
                        'Email: ${data.email}',//// ?? 'paulosho2015@gmail.com'
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(),
                    Align(
                      alignment: Alignment.topLeft, child: Text(
                      'Phone: ${data.phoneNumber}',/// ?? '+234 9025 2623 15'
                      style: const TextStyle(fontSize: 18, color: Colors.black,
                      ),
                    ),
                    ),
                    const SizedBox(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Address: ${data.address}',/// ?? 'Lagos, Nigeria'
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
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            error: (e, st) => Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Center(child: IsEmpty(err: e.toString(),),))
            )
          ],
        ),
      ),
    );
  }
}
 ////Modelled profile data
 // final ProfileModel data = ProfileModel(id: 1.toString(), profileImage: 'assets/images/profile.png', profileName: 'Paul Osho', email: 'paulosho2015@gmail.com', phoneNumber: '+234 9025 2623 15', address: 'Lagos, Nigeria');























// class MyProfile extends ConsumerWidget {
//   const MyProfile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       extendBody: true,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.black),
//         shadowColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
//       ),
//       drawer: const DrawerK(),
//       body: Padding(
//         padding: const EdgeInsets.only(
//           top: 60,
//           left: 30,
//         ),
//         child: Column(
//           children: [
//             const Text(
//               'My Profile',
//               style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w700
//               ),
//             ),
//             const SizedBox(height: 30,),
//             CircleAvatar(
//               radius: 100,
//               child: Image.asset( data.profileImage!),///'assets/images/profile.png'
//             ),
//             const SizedBox(height: 25,),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 'Name: ${data.profileName}',/// ?? 'Paul Osho'
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 'Email: ${data.email}',//// ?? 'paulosho2015@gmail.com'
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(),
//             Align(
//               alignment: Alignment.topLeft, child: Text(
//               'Phone: ${data.phoneNumber}',/// ?? '+234 9025 2623 15'
//               style: const TextStyle(fontSize: 18, color: Colors.black,
//               ),
//             ),
//             ),
//             const SizedBox(),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 'Address: ${data.address}',/// ?? 'Lagos, Nigeria'
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 50,),
//             MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){}, isSmall: true, isOrange: true),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ////Modelled profile data
// final ProfileModel data = ProfileModel(id: 1.toString(), profileImage: 'assets/images/profile.png', profileName: 'Paul Osho', email: 'paulosho2015@gmail.com', phoneNumber: '+234 9025 2623 15', address: 'Lagos, Nigeria');
