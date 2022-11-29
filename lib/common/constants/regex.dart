

// extension LocationString on String{
//   String lastTwoWords() {
//     int startIndex =0, indexOfSpace;
//     for(int i=0; i<6; i++){
//       indexOfSpace = this.indexOf('', startIndex);
//       if(indexOfSpace == -1){
//         return this;
//       }
//       startIndex = indexOfSpace + 1;
//     }
//     ///to filter the the last to words of the address
//     return this.substring(0, indexOfSpace) + '...';
//     // return the value of locations from the last [TWO] Strings
//   }
// }

extension ValidNumber on String {
  String? get validPhoneNumber {
    String? newPh;
    if (length == 11) {
      if (startsWith("0")) {
        newPh = replaceFirst(RegExp(r"0"), "234");
      }
    } else if (length > 11) {
      if (startsWith("+")) {
        newPh = replaceFirst(RegExp(r"\+"), "").trim();
      } else if (startsWith(RegExp(r"234"))) {
        newPh = this;
      }
    }

    return newPh;
  }
}



extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9])(?=.*?[!@#\><*~]).{8,}/pre>");
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this!=null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{}");
    return phoneRegExp.hasMatch(this);
  }
}