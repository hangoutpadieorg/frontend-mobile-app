import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:intl/intl.dart';

import '../../../../../../common/constants/colors.dart';
import '../../../../../../common/constants/exceptions.dart';
import '../../../../../../common/constants/general_provider.dart';
import '../../../../../../common/widgets/buttons.dart';
import '../../../../../controllers/booking_controller.dart';
import '../../../../../models/booking/book_model.dart';
import '../../../profile/components/presentation/change_password.dart';
import '../util.dart';



final TextEditingController _name = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _seats = TextEditingController();
final TextEditingController _date = TextEditingController();
TextEditingController _category = TextEditingController();
// final TextEditingController _date = TextEditingController();
// final TextEditingController _category = TextEditingController();
class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({Key? key, required this.eventId, required this.eventName, }) : super(key: key);
  final String eventId;
  final String eventName;
  // static String routeName = "/booking_page";

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  //ignore:
  final List<String> categoryItems = [
    'Regular',
    'VIP',
    'VVIP',
    'Platinum',
  ];

  String _selectedDate = 'Date & Time';

  Future<void> _selectDate(BuildContext context) async{
    final DateTime? d = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2099)
    );
    if (d != null)
      {
        setState(() {
          _selectedDate =  DateFormat.yMMMMd("en_US").format(d);
        });
      }
  }

  _dateContainer(){
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(130)),
      child: Container(
        height: 50,
        // width: 400,
        // width: getProportionateScreenWidth(50),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0,color: Colors.grey),
            left: BorderSide(width: 1.0,color: Colors.grey),
            right: BorderSide(width: 1.0,color: Colors.grey),
            bottom: BorderSide(width: 1.0,color: Colors.grey),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 14, left: 14),
          child: InkWell(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: _selectedDate,
                suffixIcon: IconButton(onPressed: (){_selectDate(context);}, icon: const Icon(Icons.calendar_today), tooltip: 'Tap to select date',),
              ),
              controller: _date,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF000000)),
              onTap: (){
                FocusScope.of(context).requestFocus(FocusNode());
                _selectDate(context);
                },
            ),
          ),
        ),
      ),
    );
  }
  String? selectedValue;
  String? eventName;
  String? eventId;

  @override

  void initState(){
    eventName = widget.eventName;
    eventId = widget.eventId;
    super.initState();
  }
  Widget build(BuildContext context) {
    // final String eventNamed = eventName;
    // String? eventId;jsj
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 30,
          right: 25
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'BOOKING',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),

              const SizedBox(height: 15,),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Please add your reservation information',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 15,),

              InputField(title: 'Name', height: 16, controller: _name, validator: (val){
                if (val!.isEmpty || _name.text.length < 2) {
                  return 'Enter a valid Name';
                }
                return null;}),
              const SizedBox(height: 30,),
              InputField(title: 'Phone Number', height: 16, controller: _phoneNumber, validator: (val){
                if (val!.isEmpty  || _phoneNumber.text.length < 11) {
                  return 'Enter a valid Phone number';
                }
                return null;}),
              const SizedBox(height: 30,),

              ////Pick date container
              _dateContainer(),
              const SizedBox(height: 30,),
              ////Category dropdown
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(130)),
                child: DropDownk(hint: 'Select category', value: selectedValue,
                  dropdownItems: categoryItems, onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    // _category = value as TextEditingController;
                    value = _category.text;/////This will save the selected value as text
                    ////// set the value of the editing controller to the selected value
                  });
                },),
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text('Number of seats',
                    style: TextStyle(fontSize: 17),),
                  const SizedBox(width: 25,),
                  _InputField(controller: _seats, validator: (val){
                    if(val!.isEmpty){
                      return 'Input number of seats';
                    }
                    return null;
                  },)
                ],
              ),

              const SizedBox(height: 40,),
              BlackButton(label: 'BOOK NOW', onTap: () async{
                if(_formKey.currentState!.validate()) {
                  ref.read(loadingProvider.state).state = true;
                  final bookingService =
                  ref.read(bookingListProvider.notifier);
                  // String eventName= eventName;
                  await bookingService
                      .createBooking(
                      bookings: BookingModels(
                          customerName: _name.text,
                          eventName: eventName!,////
                          eventId: eventId!,////
                          phoneNumber: _phoneNumber.text,
                          date: DateTime.parse(_date.text),
                          numberOfSeats: _seats.text,
                          category: _category.text))
                      .catchError((e) {
                    ref.read(loadingProvider.state).state = false;
                    if (e is CustomException) {
                      showSnackBar(context, text: e.message!);
                    } else {
                      ref.read(loadingProvider.state).state = false;
                      showSnackBar(context,
                          text: "Something is wrong!");
                    }
                  });
                  ref.read(loadingProvider.state).state = false;
                  debugPrint("Booking created");
                  showDialog(context: context, builder: (context){
                  return const DialogueK();
                 }
                );
                }
              }, isSmall: false,),
              const SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}




class _InputField extends StatelessWidget {
  const _InputField({Key? key, required this.controller, this.validator, this.inputFormatter, }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.only(right: 30),
      child: TextField(
        controller: controller,
        maxLines: 1,
        maxLength: 3,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}




