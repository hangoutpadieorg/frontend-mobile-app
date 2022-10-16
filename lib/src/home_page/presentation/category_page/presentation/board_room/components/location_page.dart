import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../common/constants/colors.dart';
import '../../../../../../../common/constants/size_config.dart';
import '../../../../../../../common/widgets/buttons.dart';
import '../../../../../hangout_menu/menu/presentation/menu.dart';


class Locate extends StatelessWidget {
  const Locate({Key? key, required this.address}) : super(key: key);
  final String address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [Align(
            alignment: Alignment.center,
            child: Text('Eko!', style: TextStyle( color: kOrange,fontSize: getFontSize(17)),))],
      ),
      drawer: Drawer(
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
                title: const Text('Location'),
                onTap: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  EditProfile()));
                },
              ),

              const SizedBox(height: 35,),
              ListTile(
                leading: const ImageIcon(AssetImage('assets/images/fork.png',), color: Colors.black,),
                title: const Text('Menu'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HangoutMenu()));
                },
              ),

              const SizedBox(height: 35,),

              MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){}, isSmall: true, isOrange: true),
              const Spacer(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenHeight(95),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'LOCATION',
                style: TextStyle(
                  color: Colors.black, fontSize: getFontSize(20), fontWeight: FontWeight.w700
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(35),
                right: getProportionateScreenWidth(35),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ADDRESS',
                  style: TextStyle(
                    color: Colors.black, fontSize: getFontSize(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(35),
                right: getProportionateScreenWidth(35),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  address,
                  style: TextStyle(
                    color: Colors.black, fontSize: getFontSize(18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35,),

            Image.asset(
              'assets/images/map.png',
              height: getProportionateScreenHeight(350),
              width: double.infinity,
            ),

            const SizedBox(height: 35,),

            BlackButton(withLogo: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "LOCATE NOW",
                    style: TextStyle(
                      fontSize: getFontSize(18.5),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 3,),
                const Icon(Icons.location_on_outlined,color: Colors.white, size: 22,),
              ],
            ), onTap: (){}, isSmall: false, label: '',),
          ],
        ),
      ),
    );
  }
}
