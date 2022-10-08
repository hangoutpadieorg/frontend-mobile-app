import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SideScrollList extends StatelessWidget {
  const SideScrollList({Key? key, required this.title, required this.widget}) : super(key: key);
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 25),
           Align(
            alignment: Alignment.topLeft,
            child: widget,
          )
        ],
      ),
    );
  }
}



class Stacked extends StatelessWidget {
  const Stacked({Key? key, required this.label, required this.coverImage, required this.onTap}) : super(key: key);
  final String label;
  final String coverImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 30
        ),
        child: Stack(
          children: [
            Container(
              height: 210,
              width: 230,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(coverImage,),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Image.asset(coverImage,
            // height: 210,
            // fit: BoxFit.cover,
            // width: 230,),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                width: 230,
                decoration: BoxDecoration(
                  color: kGrey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//////Wider stacked container
class WideStacked extends StatelessWidget {
  const WideStacked({Key? key, required this.label, required this.coverImage, required this.onTap}) : super(key: key);
  final String label;
  final String coverImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            right: 30
        ),
        child: Stack(
          children: [
            Container(
              height: 210,
              width: 230,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(coverImage,),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Image.asset(coverImage,
            // height: 210,
            // fit: BoxFit.cover,
            // width: 230,),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: kGrey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
