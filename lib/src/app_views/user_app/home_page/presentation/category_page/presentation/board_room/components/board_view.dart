import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/colors.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';

// import '../../../../../../../../common/constants/strings.dart';

import '../../../../../../booking/component/presentation/booking_page.dart';
// import '../../../../../../booking/component/util.dart';
import '../../../../../../hangout_menu/menu/presentation/menu.dart';
// import '../../../repository/category_controller.dart';
import 'location_page.dart';


////The detailed page of events
class BoardRoom extends ConsumerWidget {
  // static String routeName = "/board_room";
  const BoardRoom({Key? key,required this.latitude,required this.longitude,required this.eventId, required this.address, required this.openTime, required this.entryFee, required this.details, required this.heading, this.images}) : super(key: key);
  final String address;
  final String heading;
  final String openTime;
  final List<String> entryFee;
  final double latitude;
  final double longitude;
  final String details;
  // final String eventName;
  final String eventId;
  final List<String>? images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bars = ref.watch(categoryListProvider.notifier);
    // String fee = 'Free';
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: (){
            Navigator.pop(context);
          },
          child: Align(
            alignment: Alignment.center,
              child: Text('Back', style: TextStyle( color: kOrange,fontSize: getFontSize(17)),)),
        )],
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Locate(address: address, latitude: latitude, longitude: longitude,)));
                },
              ),

              const SizedBox(height: 25,),
              ListTile(
                leading: const ImageIcon(AssetImage('assets/images/fork.png',), color: Colors.black,),
                title: const Text('Menu'),
                onTap: (){
                  // Navigator.of(context).pushNamed(hangoutMenu);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HangoutMenu()));
                },
              ),

              const SizedBox(height: 35,),

              MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(eventId: eventId, eventName: heading,)));
                // Navigator.pushNamed(context, myBooking);
              }, isSmall: true, isOrange: true),
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
                heading ?? '',
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
                address ?? '',
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
            const SizedBox(height: 5,),
            SizedBox(
              width: 150,
              child: Row(children: [const Icon(Icons.location_on_outlined,color: Colors.black, size: 22,)
                ,const SizedBox(width: 2,), Text('Opens $openTime')],),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              width: 150,
              child: Row(children: [const ImageIcon(
                  AssetImage('assets/images/flag.png')
              ),const SizedBox(width: 2,), const Text('Ticket Fee:'),
                const SizedBox(width: 1,),
                GestureDetector(child: const Text('Click here', style: TextStyle(color: kOrange),),
                onTap: (){
                  showDialog(context: context, builder: (context){
                    //// Action to perform
                    // List<String> list = [];
                    return  _DialogueK(fees:
                      entryFee,
                      strings: entryFee,);
                  }
                  );
                },
              )],
              ),
            ),

            const SizedBox(height: 50,),
            /* Needs some style implementation */
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




class _DialogueK extends StatelessWidget {
  const _DialogueK({Key? key, required this.fees, required this.strings}) : super(key: key);
  final List<String>? strings;
  final List<String>? fees;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      content: Builder(builder: (context){
        return SizedBox(
          height: getProportionateScreenHeight(449),
          child: Center(
            child: Column(
              children: [
                const ImageIcon(
                    AssetImage('assets/images/flag.png')
                ),const SizedBox(width: 2,), const Text('Ticket Fees'),
                const SizedBox(height: 25,),
                SizedBox(
                  height: 100,////Fixed height
                  child: ListView.builder(itemBuilder: (context, index){
                    return ListTile(
                      title: Text(
                        strings![index],
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style:const TextStyle(
                            fontSize: 19,
                            // color: kWhiteText,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      leading:  Text(
                        fees![index],
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          // color: kWhiteText,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

 /*Column(
       crossAxisAlignment: CrossAxisAlignment.start,
                    children: strings.map((str) {
                      return ListTile(
                        title: Text(
                          str,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style:const TextStyle(
                              fontSize: 19,
                              // color: kWhiteText,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        leading:  Text(
                          '$fees',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            // color: kWhiteText,
                          ),
                        ),
                      );
                    }).toList(),
                  )*/