import 'package:flutter/material.dart';
import 'package:padie_mobile/common/constants/colors.dart';
import 'package:padie_mobile/src/models/category/category_model.dart';




class ListWidget extends StatelessWidget {
  const ListWidget({Key? key,  required this.onTap, required this.cats}) : super(key: key);
  /*______________________Category model_____________________*/
  final CategoryModel cats;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 30,
          top: 20,
        ),
        child: Stack(
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(cats.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                // width: getProportionateScreenWidth(300),
                decoration: BoxDecoration(
                  color: kGrey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    cats.label,
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
