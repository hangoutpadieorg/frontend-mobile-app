import 'package:flutter/material.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/constants/colors.dart';
import '../../auth_pages/sign_up/sign_up.dart';



class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key, }) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  // final String subtitle;
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
_storeBoardInfo() async{
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
}

  Widget buildPage({
  // required Color color,
  required String imageUrl,
  required String description,
  })=> SingleChildScrollView(
    physics: const ScrollPhysics(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipPath(
          clipper: ClipPathClass(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration:  BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: () async{
                  await _storeBoardInfo();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUp())
                  );
                },
                child: const Text('Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.5,
                  ),
                ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              height: 147,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Color(0x80FF5403),
                        activeDotColor: kOrange,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(child: Text(description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  ),
                  isLastPage ?
                  GestureDetector(
                    onTap: () async{
                      await _storeBoardInfo();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: kOrange,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: getProportionateScreenHeight(65),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                      : Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: (){
                        controller.nextPage(duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text('Next',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ) ,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index){
          setState(() {
            isLastPage = index == 2;
          });
        },
        children: [
          buildPage(
            imageUrl: 'assets/images/ob_1.jfif',
            description: "Don't stress about location, let's help you take\n"
                "your friday from 0 to 100",
          ),
          buildPage(
            imageUrl: 'assets/images/ob_2.jfif',
            description: "You probably need a place to celebrate your\n"
                "wins with your friends. Don't fret, we gatchu",
          ),
          buildPage(
            imageUrl: 'assets/images/ob_3.jfif',
            description: ''
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(-150 ,size.height -180);
    // path.quadraticBezierTo(size.width * 0.05, size.height -100, size.width, size.height);
    path.quadraticBezierTo(size.width + 150, size.height+300 , size.width, size.height * 0.05);
    path.lineTo(size.width + 100, 0);
    path.close();
    // var firstControlPoint = Offset(size.width / , 4);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }}