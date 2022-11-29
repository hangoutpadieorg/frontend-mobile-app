import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../common/constants/colors.dart';
import '../../../../../../common/constants/general_provider.dart';
import '../../../../../../common/constants/size_config.dart';
import '../../../../../../common/constants/utils.dart';
import '../../../../../../common/widgets/buttons.dart';
import '../../../../../controllers/auth_controller.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../login/login.dart';

class OtpVerification extends ConsumerStatefulWidget {
  static const routeName = "/otp";
  const OtpVerification(
      {this.email,
        this.password,
        this.password2,
        // this.referrer,
        this.fullName,
        this.role = 'role',
        Key? key,
        this.phoneNumber = "00000000000"})
      : super(key: key);

  final String? phoneNumber;
  final String? email;
  final String? password;
  final String? password2;
  final String role;
  // final String? referrer;
  final String? fullName;

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends ConsumerState<OtpVerification> {
  // final NumbersStore store = VxState.store;
  TextEditingController controller = TextEditingController(text: "");
  bool isapicallprocess = false;
  bool isapicallprocess2 = false;
  String thisText = "";
  int pinLength = 6;
  bool hasError = false;
  String? errorMessage;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? otp;
  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authControllerProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/splash_bg.jfif'
              ),
              filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              opacity: 0.5,
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(90), bottom: 17),
                  height: getProportionateScreenHeight(220),
                  width: getProportionateScreenWidth(300),
                  child: Image.asset("assets/images/otp.png"),
                ),
              ),
              Text(
                "OTP Verification",
                style: TextStyle(
                    fontSize: getFontSize(24),
                    fontFamily: "Ubuntu",
                    color: kGrey,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: getProportionateScreenHeight(26),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Enter the 6 digit code sent to\n"),
                    TextSpan(
                      text: widget.email,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                  style: const TextStyle(color: kGrey,),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(34.5),
              ),
              PinCodeTextField(
                autofocus: true,
                controller: controller,
                maxLength: pinLength,
                hasError: hasError,
                pinBoxOuterPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                onTextChanged: (text) {
                  setState(() {
                    hasError = false;
                  });
                },
                onDone: (text) {
                  setState(() {
                    otp = text;
                  });
                },
                pinBoxWidth: getProportionateScreenWidth(48),

                wrapAlignment: WrapAlignment.spaceBetween,
                pinBoxDecoration: (
                    color,
                    pinBoxColor, {
                      double borderWidth = 1.0,
                      double radius = 0,
                    }) {
                  return BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: kGrey,
                        width: borderWidth,
                      ),
                    ),
                  );
                },
                pinTextStyle: const TextStyle(fontSize: 22.0, color: kGrey),
                pinTextAnimatedSwitcherTransition:
                ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                pinTextAnimatedSwitcherDuration:
                const Duration(milliseconds: 100),
//                    highlightAnimation: true,
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: getProportionateScreenHeight(70.0),
              ),
              Text(
                "Didn't receive the OTP?",
                style: TextStyle(
                  color: kGrey,
                  fontSize: getFontSize(14),
                ),
              ),

              if(isapicallprocess2)
                kProgressIndicator,
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(10.0),
                  bottom: getProportionateScreenHeight(30.0),
                ),
                child: InkWell(
                  onTap: () async {
                    // bool status = await auth
                    //.resendOTP(widget.phoneNumber.validPhoneNumber);
                    ref.read(loadingProvider.state).state = true;
                    setState(() {
                      isapicallprocess2 = true;
                    });
                    final response = await auth.register(
                      name: widget.fullName!,
                      role: widget.role,
                      email: widget.email!,
                      password: widget.password!,
                      password2: widget.password2!,
                      // phoneNumber: widget.phoneNumber!,
                      // fcmToken: "NO DATA", photoUrl: '',
                    );
                    response.fold((e) {
                      ref.read(loadingProvider.state).state = false;
                      setState(() {
                        isapicallprocess2 = false;
                      });
                      showSnackBar(context, text: "Unable to send OTP");
                    }, (status) {
                      if (status == 200 || status == 201) {
                        setState(() {
                          isapicallprocess2 = false;
                        });
                        ref.read(loadingProvider.state).state = false;
                        showSnackBar(context, text: "OTP sent successfully");
                      }
                    });
                  },
                  child: Text(
                    "RESEND OTP",
                    style: TextStyle(
                        color: kGrey,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(14)),
                  ),
                ),
              ),
              if(isapicallprocess)
                kProgressIndicator,
              MyButton(withLogo: false,
                label: 'Verify',
                isSmall: false,
                isOrange: true,
                onTap: () async {
                  setState(() {
                    isapicallprocess = true;
                  });
                  ref.read(loadingProvider.state).state = true;
                  bool? status = await auth.confirmOTP(otp);
                  if (status!) {
                    // ref.watch(loadingProvider).state = false;
                    ref.read(loadingProvider.state).state = false;
                    setState(() {
                      isapicallprocess = false;
                    });
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: getProportionateScreenHeight(75)),
                              Center(
                                  child: Image.asset(
                                      "assets/images/happy.png")),
                              Text(
                                "Congratulations!",
                                style: TextStyle(
                                  fontSize: getFontSize(24.0),
                                  // fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(12),
                                  bottom: getProportionateScreenHeight(12),
                                ),
                                child: Text(
                                  "Welcome to hangout padie",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: getFontSize(18.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  MyButton(withLogo: false,
                                    // label: 'SIGN UP',
                                    isSmall: false,
                                    isOrange: false,
                                    label: "Let's go",
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (context)
                                          => const Login()), (route) => false);
                                    },
                                  ),
                                  Positioned(
                                    right: getProportionateScreenWidth(12),
                                    top: getProportionateScreenHeight(10.0),
                                    bottom:
                                    getProportionateScreenHeight(10.0),
                                    child: Image.asset(
                                        "assets/images/biceps_emoji.png"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(63)),
                            ],
                          ),
                        );
                  }
              );
              }}),
            ],
          ),
        ),
      ),
    );
  }
}
