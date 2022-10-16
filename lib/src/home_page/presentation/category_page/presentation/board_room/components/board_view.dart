

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/src/home_page/hangout_menu/menu/presentation/menu.dart';

import '../../../../../../../common/constants/colors.dart';
import '../../../../../../../common/widgets/buttons.dart';
import 'location_page.dart';


////The detailed page of events
class BoardRoom extends StatelessWidget {
  const BoardRoom({Key? key, required this.address, required this.openTime, required this.entryFee, required this.details, required this.heading, this.images}) : super(key: key);
  final String address;
  final String heading;
  final String openTime;
  final String entryFee;
  final String details;
  final List<String>? images;

  @override
  Widget build(BuildContext context) {
    // String fee = 'Free';
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Locate(address: address,)));

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
          top: getProportionateScreenHeight(20),
          left: getProportionateScreenWidth(35),
          right: getProportionateScreenWidth(35),
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                heading,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: Text(
                address,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 50,),

            SizedBox(
                width: 150,
                child: Row(children: const [ImageIcon(
                  AssetImage('assets/images/mugs.png')
                ),SizedBox(width: 2,), Text('Bar & Lounge')],),
                ),
            const SizedBox(height: 10,),
            SizedBox(
              width: 150,
              child: Row(children: [const Icon(Icons.location_on_outlined,color: Colors.black, size: 22,)
                ,const SizedBox(width: 2,), Text('Opens $openTime')],),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: 150,
              child: Row(children: [const ImageIcon(
                  AssetImage('assets/images/flag.png')
              ),const SizedBox(width: 2,), Text('Entry Fee: $entryFee')],),
            ),

            const SizedBox(height: 50,),

            Text(
              details,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30,),

            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: images!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 210,
                      width: MediaQuery.of(context).size.width * 0.56,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(images![index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
