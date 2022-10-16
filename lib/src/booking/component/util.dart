import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/constants/colors.dart';
import '../../../common/constants/size_config.dart';


class DialogueK extends StatelessWidget {
  const DialogueK({Key? key}) : super(key: key);

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
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                  ),
                  child: Image.asset('assets/images/happy.png'),
                ),
                const Text('Booking Successful',style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),),
                const SizedBox(height: 18,),
                const Text('Your booking details has been sent to your mail',style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.5,
                ),),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _MyButton(label: 'SHARE', onTap: (){},  withLogo: true, isOrange: true, icon: FontAwesomeIcons.shareNodes,),
                      // const SizedBox(width: 20,),
                      _MyButton(label: 'ADD TO\nCALENDAR', onTap: (){},  withLogo: false, isOrange: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}




////Analog box custom Button
class _MyButton extends StatelessWidget {
  const _MyButton({Key? key, required this.label, required this.onTap,required this.withLogo, required this.isOrange, this.icon}) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final bool isOrange;
  final bool withLogo;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isOrange ? BoxDecoration(
            shape: BoxShape.rectangle,
            color: kOrange,
            borderRadius: BorderRadius.circular(10)
        ) : BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        width: getProportionateScreenWidth(125),
        height: getProportionateScreenHeight(65),
        child: Align(
          alignment: Alignment.center,
          child: withLogo ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                maxLines: 1,
                style: TextStyle(
                  fontSize: getFontSize(18),
                  color: isOrange ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(width: 7,),
              FaIcon(icon,  color: Colors.white,),
            ],
          ) : Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: getFontSize(16),
                color: isOrange ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class DropDownK extends StatefulWidget {
  const DropDownK({Key? key,}) : super(key: key);

  @override
  State<DropDownK> createState() => _DropDownKState();
}

class _DropDownKState extends State<DropDownK> {
  final List<String> category_items = [
    'Regular',
    'VIP',
    'VVIP',
    'Platinum',
  ];

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  String? prefix;
  late final bool isDate;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: const Text(
          'Select category',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        items:  category_items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
        ),
        iconSize: 14,
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: getProportionateScreenWidth(270),
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.black26,
          ),
          color: Colors.transparent,
        ),
        buttonElevation: 0,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: 200,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }
}





class DropDownk<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<T?> dropdownItems;
  final ValueChanged<T?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  // final Offset? offset;

  const DropDownk({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<T>(
          value: item,
          child: Container(
            alignment: valueAlignment,
            child: Text(
              item.toString(),////To convert the value of Type T? to Type String
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
        iconSize: iconSize ?? 14,
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.grey,
        buttonHeight: buttonHeight ?? 50,
        buttonWidth: buttonWidth ?? getProportionateScreenWidth(250),
        buttonPadding:
        buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ?? 200,
        dropdownWidth: dropdownWidth ?? 250,
        dropdownPadding: dropdownPadding,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: const Offset(-20, 0),
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}