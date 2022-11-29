import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/common/constants/utils.dart';
// import '../../auth_repository/auth_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../../../../common/constants/colors.dart';
import '../../../../../../common/constants/general_provider.dart';
import '../../../../../../common/constants/strings.dart';
import '../../../../../../common/widgets/buttons.dart';
import '../../../../../../common/widgets/textfields.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../user_app/nav_bar.dart';
import 'otp_page.dart';


class SignupView extends ConsumerStatefulWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  // static String routeName = "/sign_up";
  bool isapicallprocess = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final signUpProvider = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Container(
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
        child: Center(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(80),
                  right: getProportionateScreenWidth(25),
                  left: getProportionateScreenWidth(31)
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Welcome to hangout padie',
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 25,
                      ),
                    ),

                    const SizedBox(height: 50,),

                    MyTextField(title: 'Full Name',
                      height: 16,
                      controller: _name,
                      validator: (val) {
                        //Name must contain both Surname and Lastname
                        if (val!.split(" ").length < 2) {
                          return 'Must contain atleast 2 names';
                        }
                        return null;
                      },),
                    const SizedBox(height: 24,),
                    MyTextField(title: 'Email Address',
                        height: 16,
                        controller: _email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Empty Field.";
                          } else if (!emailValidatorRegExp.hasMatch(value)) {
                            return "invalid email address";
                          }

                          return null;
                        }),
                    const SizedBox(height: 24,),
                    MyTextField(title: 'Password',
                      height: 16,
                      controller: _password,
                      validator: (value) {
                        //Password must not be less than 6
                        if (value!.isEmpty) {
                          return "Empty Field.";
                        } else if (!atleastOneLowerCase.hasMatch(value)) {
                          return "Must contain atleast 1 lowercase letter";
                        } else if (!atLeastOneUpperCase.hasMatch(value)) {
                          return "Must contain atleast 1 uppercase letter";
                        } else if (!atleastOneDigit.hasMatch(value)) {
                          return "Must contain atleast 1 digit";
                        } else if (!atleastOneSpecial.hasMatch(value)) {
                          return "Must contain atleast 1 special character";
                        } else if (value.length < 6) {
                          return "Password too short!";
                        }
                        return null;
                      },),
                    const SizedBox(height: 24,),
                    MyTextField(title: 'Confirm Password',
                      height: 16,
                      controller: _confirm_password,
                      validator: (val) {
                        //Password must not be less than 6
                        if (val!.isEmpty) return 'Empty';
                        if (val != _password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },),
                    const SizedBox(height: 50,),
                    if(isapicallprocess)
                      kProgressIndicator,
                    MyButton(withLogo: false,
                      label: 'SIGN UP',
                      isSmall: false,
                      isOrange: true,
                      onTap: () async {
                      final form = _formKey.currentState;
                        if (form!.validate()) {
                          form.save();
                          setState(() {
                            isapicallprocess = true;
                          });
                          ref
                              .read(loadingProvider.state)
                              .state = true;
                          // if (load) CircularProgressIndicator();
                          //  String? fcmToken = await Preferences().getFCMToken();
                          final auth = ref.read(
                              authControllerProvider.notifier);

                          final response = await auth.register(
                            role: "user",
                            name: _name.text,
                            email: _email.text,
                            password: _password.text,
                            password2: _confirm_password.text,
                            // phoneNumber: 'Edit profile to update password', fcmToken: "NO DATA", // photoUrl: '',
                          );
                          debugPrint('Signup Ongoing');
                          debugPrint('This response: $response');
                          // if(response != null){
                          //   setState(() {
                          //     isapicallprocess = false;
                          //   });
                          //   ref
                          //       .read(loadingProvider.state)
                          //       .state = false;
                          //   showSnackBar(
                          //       context, text: "Sign Up successful!");
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => OtpVerification(
                          //           fullName: _name.text,
                          //           phoneNumber: 'Edit profile to update password',
                          //           email: _email.text,
                          //           password: _password.text,
                          //           password2: _confirm_password.text,
                          //         )
                          //     ),
                          //   );
                          // }
                          response.fold((e) {
                            setState(() {
                              isapicallprocess = false;
                            });
                            ref
                                .read(loadingProvider.state)
                                .state = false;
                            showSnackBar(context, text: e.toString());
                            debugPrint('Error : ${e.toString()}');
                          }, (status) {
                            if (status == 200 || status == 201) {
                              setState(() {
                                isapicallprocess = false;
                              });
                              ref
                                  .read(loadingProvider.state)
                                  .state = false;
                              showSnackBar(
                                  context, text: "Sign Up successful!");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpVerification(
                                      fullName: _name.text,
                                      phoneNumber: 'Edit profile to update password',
                                      email: _email.text,
                                      password: _password.text,
                                      password2: _confirm_password.text,
                                    )
                                ),
                              );
                            } else if (status == 404 || status == 400 || status == 409){
                              setState(() {
                                isapicallprocess = false;
                              });
                              ref
                                  .read(loadingProvider.state)
                                  .state = false;
                              showSnackBar(
                                  context, text: "Sign Up unsuccessful!");
                            }
                            else {
                              setState(() {
                                isapicallprocess = false;
                              });
                              ref
                                  .read(loadingProvider.state)
                                  .state = false;
                              showSnackBar(
                                  context, text: "Sign Up unsuccessful!");
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => OtpVerification(
                              //         fullName: _name.text,
                              //         phoneNumber: 'Edit profile to update password',
                              //         email: _email.text,
                              //         password: _password.text,
                              //         password2: _confirm_password.text,
                              //       )
                              //   ),
                              // );
                            }
                          });
                        }
                      },),
                    const SizedBox(height: 20,),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 18,
                        color: kGrey,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    MyButton(label: 'SIGN UP WITH GOOGLE',
                      onTap: () async {
                        ref
                            .read(loadingProvider.state)
                            .state = true;
                        final GoogleSignIn google = GoogleSignIn();
                        GoogleSignInAccount? user;
                        // GoogleSignInAccount?  get _userK => _users;
                        final userK =  await google.signIn();
                        // final _user = _google.currentUser;
                        user = userK;
                        debugPrint(user!.displayName);
                        debugPrint("User Id: ${user.id}");
                        debugPrint(user.email);
                        final auth = ref.read(authControllerProvider.notifier);
                        final response = await auth.registerWithOauth(
                            email: user.email,
                            // password: 'no password',
                            // phoneNumber: '00000000000',
                            fullName: user.displayName!,
                            photoUrl: user.photoUrl!,
                            // fcmToken: 'NO DATA',
                            role: "user",
                            id: user.id);
                        response.fold((e) {
                          ref
                              .read(loadingProvider.state)
                              .state = false;
                          showSnackBar(context, text: e);
                        },
                                (status) {
                              if (status == 200 || status == 201) {
                                ref
                                    .read(loadingProvider.state)
                                    .state = false;
                                // switch(this.US)
                                //   case: USERTYPE.googleUser;
                                showSnackBar(
                                    context, text: "Sign Up successful!");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nav()
                                  ),
                                );
                              } else {
                                ref
                                    .read(loadingProvider.state)
                                    .state = false;
                                showSnackBar(
                                    context, text: "Sign Up unsuccessful!");
                              }
                            });
                      },
                      isSmall: false,
                      isOrange: false,
                      withLogo: true,
                      icon: FontAwesomeIcons.google,),
                    const SizedBox(height: 22,),
                    MyButton(label: 'SIGN UP WITH APPLE',
                      onTap: () async{
                        // Navigator.of(context).pushNamed(navigation);
                        ref
                            .read(loadingProvider.state)
                            .state = true;
                        final credentials = await SignInWithApple.getAppleIDCredential
                          (scopes: [
                            AppleIDAuthorizationScopes.email,
                            AppleIDAuthorizationScopes.fullName,
                        ],
                          webAuthenticationOptions: WebAuthenticationOptions(
                              clientId: 'clientId',
                              redirectUri: Uri.parse('redirectUri'),
                          ),
                        );
                        // ignore: avoid_print
                        print(credentials);
                        final auth = ref.read(authControllerProvider.notifier);
                        final response = await auth.registerWithOauth(
                            email: credentials.email!,
                            // password: 'password',
                            role: "user",
                            // phoneNumber: 'phoneNumber',
                            fullName: "${credentials.givenName!} ${credentials.familyName!}",
                            photoUrl: 0.toString(),
                            // fcmToken: 'NO DATA',
                            id: credentials.identityToken!);
                        response.fold((e) {
                          ref
                              .read(loadingProvider.state)
                              .state = false;
                          showSnackBar(context, text: e);
                        },
                                (status) {
                              if (status == 200 || status == 201) {
                                ref
                                    .read(loadingProvider.state)
                                    .state = false;
                                // switch(this.US)
                                //   case: USERTYPE.googleUser;
                                showSnackBar(
                                    context, text: "Sign Up successful!");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nav()
                                  ),
                                );
                              } else {
                                ref
                                    .read(loadingProvider.state)
                                    .state = false;
                                showSnackBar(
                                    context, text: "Sign Up unsuccessful!");
                              }
                            });
                      },
                      isSmall: false,
                      isOrange: false,
                      withLogo: true,
                      icon: FontAwesomeIcons.apple,),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Already an existing User?',
                          style: TextStyle(
                            fontSize: getFontSize(16.5),
                            color: Colors.white54,
                          ),
                        ),
                        const SizedBox(width: 3,),
                        TextButton(onPressed: () {
                          Navigator.of(context).pushReplacementNamed(login);
                        }, child: Text(
                          'LOGIN HERE',
                          style: TextStyle(
                            fontSize: getFontSize(16.5),
                            color: Colors.white,
                          ),
                        )),
                      ],),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//   Future signUp(BuildContext context) async{
//     // final _googleUser = ref.read(authServiceProvider).googleSignIn();
//     ProviderRef? ref;
//
// }
final TextEditingController _name = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _confirm_password = TextEditingController();
