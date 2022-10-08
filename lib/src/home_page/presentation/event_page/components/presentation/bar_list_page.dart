import 'package:flutter/material.dart';
import 'package:padie_mobile/common/widgets/side_scroll_lists.dart';

import '../../../../../../common/constants/colors.dart';
import '../domain/bar_model.dart';
import '../util.dart';

class Bars extends StatefulWidget {
  const Bars({Key? key}) : super(key: key);

  @override
  State<Bars> createState() => _BarsState();
}

class _BarsState extends State<Bars> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldK(
      lists: ListView.builder(
        itemCount: BarModel.bars.length,
        itemBuilder: (context, index){
          return _ListWidget(onTap: (){}, event: BarModel.bars[index]);
        },
      ),
      title: 'BARS',
    );
  }
}


class _ListWidget extends StatelessWidget {
  const _ListWidget({Key? key,  required this.onTap, required this.event}) : super(key: key);
  final Bar event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          // right: 30,
          top: 40,
        ),
        child: Stack(
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(event.imageUrl),
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
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: kGrey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    event.label,
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