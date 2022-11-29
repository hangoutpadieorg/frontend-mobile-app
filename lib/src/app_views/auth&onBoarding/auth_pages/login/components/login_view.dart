import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../../../../common/constants/colors.dart';
import '../../../../../../common/constants/general_provider.dart';
import '../../../../../../common/constants/strings.dart';
import '../../../../../../common/constants/utils.dart';
import '../../../../../../common/widgets/buttons.dart';
import '../../../../../../common/widgets/textfields.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../../services/auth/shared_prefernces.dart';
import '../../../../user_app/nav_bar.dart';
import 'forgot_password/forgot_password.dart';


class LoginView extends ConsumerStatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  // static String routeName = "/welcome";
  final _formKey = GlobalKey<FormState>();
  bool isapicallprocess = false;
  final Preferences prefs = Preferences();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
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
                  left: getProportionateScreenWidth(31),
                bottom: getProportionateScreenHeight(50)
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 25,
                      ),
                    ),

                    const SizedBox(height: 40,),

                    MyTextField(title: 'Email Address', height: 16, controller: _email, validator: (val){
                      if (val!.isEmpty || !_email.text.contains('@')) {
                        return 'Please enter valid email';
                      }
                      else {
                        return null;
                      }
                    },),
                    const SizedBox(height: 18,),
                    MyTextField(title: 'Password', height: 16, controller: _password, validator: (value){
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
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pushNamed(forgotPassword);
                        },
                          child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                              ),
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 47,),
                    if(isapicallprocess)
                      kProgressIndicator,
                    MyButton(label: 'LOGIN', isSmall: false, isOrange: true,withLogo: false,
                      // Navigator.of(context).pushReplacementNamed(navigation);
                      onTap: () async{
                      //Push and never return back the page until after logout
                        setState(() {
                          isapicallprocess = true;
                        });
                      ref.read(loadingProvider.state).state =true;
                      final auth = ref.read(authControllerProvider.notifier);
                      var email = _email.text;
                      var password = _password.text;

                      final response = await auth.login(email, password);

                      response.fold((e) {
                        ref.read(loadingProvider.state).state = false;
                        showSnackBar(context, text: 'Error: $e');
                      }, (tokens) async {
                        await prefs.setToken(tokens!["access"]);
                        await prefs.setRefreshToken(tokens["refresh"]);
                        ref.read(loadingProvider.state).state =false;
                        setState(() {
                          isapicallprocess = true;
                        });
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) => Nav()), (route) => false);
                      });

                    },
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 18,
                        color: kGrey,
                      ),
                    ),
                    const SizedBox(height: 30,),

                    MyButton(label: 'LOGIN WITH GOOGLE', onTap: () async{
                      ref.read(loadingProvider.state).state =true;
                      final GoogleSignIn google = GoogleSignIn();
                      GoogleSignInAccount? user;
                      // GoogleSignInAccount?  get _userK => _users;
                      final userK =  await google.signIn();
                      // final _user = _google.currentUser;
                      user = userK;
                      final auth = ref.read(authControllerProvider.notifier);
                      var userId = user?.id;
                      var email = user?.email;
                      final response = await auth.loginWithOauth(userId!, email!);
                      response.fold((error) {
                        ref.read(loadingProvider.state).state = false;
                        showSnackBar(context, text: error!);
                      }, (tokens) async {
                        await prefs.setToken(tokens!["access"]);
                        await prefs.setRefreshToken(tokens["refresh"]);
                        ref.read(loadingProvider.state).state =false;
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) => Nav()), (route) => false);
                      });

                    }, isSmall: false, isOrange: false,withLogo: true, icon: FontAwesomeIcons.google,),
                    const SizedBox(height: 22,),

                    MyButton(label: 'LOGIN WITH APPLE', onTap: () async{
                      ref.read(loadingProvider.state).state = true;
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
                      var userId = credentials.identityToken;
                      var email = credentials.email;
                      final response = await auth.loginWithOauth(userId!, email!);
                      response.fold((error) {
                        ref.read(loadingProvider.state).state = false;
                        showSnackBar(context, text: error!);
                      }, (tokens) async {
                        await prefs.setToken(tokens!["access"]);
                        await prefs.setRefreshToken(tokens["refresh"]);
                        ref.read(loadingProvider.state).state =false;
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) => Nav()), (route) => false);
                      });
                    }, isSmall: false, isOrange: false,withLogo: true, icon: FontAwesomeIcons.apple,),
                    // const SizedBox(height: 20,)
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
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
