import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/src/booking/component/util.dart';
import 'package:intl/intl.dart';
import '../../../../common/widgets/buttons.dart';
import '../../../profile/components/presentation/change_password.dart';



final TextEditingController _name = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _seats = TextEditingController();
// final TextEditingController _date = TextEditingController();
// final TextEditingController _category = TextEditingController();
class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  //ignore:
  final List<String> category_items = [
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Text(
                  _selectedDate,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFF000000)),
                ),
                onTap: (){_selectDate(context);},
              ),
              IconButton(onPressed: (){_selectDate(context);}, icon: const Icon(Icons.calendar_today), tooltip: 'Tap to select date',),
            ],
          ),
        ),
      ),
    );
  }
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
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
                if (val!.isEmpty || _name.text.length >2) {
                  return 'Enter a valid Name';
                }
                return null;}),
              const SizedBox(height: 30,),
              InputField(title: 'Phone Number', height: 16, controller: _phoneNumber, validator: (val){
                if (val!.isEmpty || val!.isEmpty || _phoneNumber.text.length < 11) {
                  return 'Enter a valid Phone number';
                }
                return null;}),
              const SizedBox(height: 30,),

              ////Pick date
              _dateContainer(),
              const SizedBox(height: 30,),
              ////Category dropdown
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(130)),
                child: DropDownk(hint: 'Select category', value: selectedValue,
                  dropdownItems: category_items, onChanged: (value) {
                  setState(() {
                    selectedValue = value;
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
                  },)
                ],
              ),

              const SizedBox(height: 40,),
              BlackButton(label: 'BOOK NOW', onTap: (){
                if(_formKey.currentState!.validate()) {
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}




