import 'package:flutter/material.dart';
import 'components/presentation/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String routeName = "/profile_page";

  @override
  Widget build(BuildContext context) {
    return const MyProfile();
  }
}
