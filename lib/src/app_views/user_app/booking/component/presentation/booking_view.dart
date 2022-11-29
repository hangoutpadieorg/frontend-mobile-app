import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../../common/constants/strings.dart';

import '../../../../../../common/widgets/appbar.dart';
import '../../../../../../common/widgets/buttons.dart';
import '../../../../../controllers/booking_controller.dart';
import '../../../home_page/presentation/location_page/location.dart';
import 'booking_page.dart';


class MyBooking extends ConsumerWidget {
  const MyBooking({Key? key}) : super(key: key);
  // static String routeName = "/my_booking";

  @override

  Widget build(BuildContext context, WidgetRef ref) {
    final isThere = ref.watch(bookingListProvider);
    // final profileFuture = ref.watch(profileControllerProvider);
    if(isThere.hasValue){
      return const _BookingList();
    }else {
      return const _DefaultBook();
    }
  }
}


class _DefaultBook extends StatelessWidget {
  const _DefaultBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MY BOOKING',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700
              ),
            ),

            const SizedBox(height: 15,),
            const Text(
              'Please view your bookings below',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15,),


            const Text(
              'You have not booked any reservation',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            MyButton(label: 'BOOK NOW', withLogo: false, onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const BookingPage(eventId: '', eventName: '',)));}, isSmall: true, isOrange: true),
              // Navigator.pushNamed(context, bookingPage, arguments: a);}, isSmall: true, isOrange: true),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}



class _BookingList extends ConsumerWidget {
  const _BookingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booking = ref.watch(bookingListProvider);
    return Scaffold(
      appBar: appBar(context),
      body: booking.when(
          data: (data) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Text(
                  'MY BOOKING',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700
                  ),
                ),

                const SizedBox(height: 15,),
                const Text(
                  'Please view your bookings below',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 15,),

                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemCount: data.length,////
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(top: 15,),
                          child: ContainerK(
                            label: data[index].eventName,
                          ),
                        );
                      }),
                ),


              ],
            ),
          ),
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (e, st) => const SizedBox(),
      ),
    );
  }
}
