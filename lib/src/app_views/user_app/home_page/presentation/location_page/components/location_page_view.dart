import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/common/constants/colors.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/src/controllers/category_controller.dart';
import 'package:padie_mobile/src/models/category/category_model.dart';


// import '../../../../../../common/widgets/appbar.dart';

import '../../../../../../../common/widgets/isEmpty.dart';
import '../../category_page/presentation/board_room/components/board_view.dart';
import 'list_widget.dart';


class SelectedLocationView extends ConsumerWidget {
  const SelectedLocationView({Key? key, required this.location}) : super(key: key);
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,////80
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // leading: Text('yes'),
        shadowColor: Colors.transparent,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
                left: 20,
                right: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 16,
                          // fontFamily: "MISTRAL",
                          // fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),

                TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Back', style: TextStyle(color: kOrange),)),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: categories.isNotEmpty ? SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 32,
                  left: 40
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      location,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getFontSize(22),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 35,),

                  const _TopRated(),

                  // const SizedBox(height: 5,),

                  const _Categories(),

                  // const SizedBox(height: 5,),

                  const _NewlyOpened(),

                  // const SizedBox(height: 5,),

                  const _Events(),
                  const SizedBox(height: 35,),
                ],
              ),
            ),
          ),
        ) : const Center(child: IsEmpty(err: 'List is empty')),
      ),
    );
  }
}




class _Categories extends ConsumerWidget {
  const _Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);
    // var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      child: categories.isNotEmpty ? SizedBox(
        // height: getProportionateScreenHeight(250),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'CATEGORIES',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(19),
                  ),
                ),
              ),

              const SizedBox(height: 25,),

              GridView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  // physics: const ScrollPhysics(),
                  itemCount: categories.length,

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                    // maxCrossAxisExtent: 400,
                    // childAspectRatio: 1,
                    // mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return _SmallStacked(
                        cats: categories[index],
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  BoardRoom(
                                    address:  categories[index].address,///BarModel.bars.
                                    heading:  categories[index].label,
                                    openTime:  categories[index].openTime,
                                    entryFee:  categories[index].entryFee as List<String>,
                                    details:  categories[index].details,
                                    images:  categories[index].detailImages as List<String>,
                                    latitude: categories[index].latitude as double,
                                    longitude: categories[index].longitude as double,
                                    eventId: categories[index].id!,
                                  )
                              )
                          );
                        });
                  })
            ]
        ),
      ) : null,
    );
  }
}


class _NewlyOpened extends ConsumerWidget {
  const _NewlyOpened({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);
    return SizedBox(
      child: categories.isNotEmpty ? SizedBox(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Newly opened locations',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(19),
                  ),
                ),
              ),

              const SizedBox(height: 0,),

              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: categories.length,////
                    itemBuilder: (context, index){
                      return ListWidget(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
                          address:  categories[index].address,///BarModel.bars.
                          heading:  categories[index].label,
                          openTime:  categories[index].openTime,
                          entryFee:  categories[index].entryFee as List<String>,
                          details:  categories[index].details,
                          latitude: categories[index].latitude as double,
                          longitude: categories[index].longitude as double,
                          images:  categories[index].detailImages as List<String>,
                          eventId: categories[index].id!,
                        )));
                      }, cats: categories[index]);
                    },
                  ),
                ),
              ),
            ]
        ),
      ) : null,
    );
  }
}


class _Events extends ConsumerWidget {
  const _Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);
    return SizedBox(
      child: categories.isNotEmpty ? SizedBox(
        height: getProportionateScreenHeight(500),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'EVENTS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(19),
                  ),
                ),
              ),

              const SizedBox(height: 25,),

              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index){
                      return ListWidget(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
                          address:  categories[index].address,///BarModel.bars.
                          heading:  categories[index].label,
                          openTime:  categories[index].openTime,
                          entryFee:  categories[index].entryFee as List<String>,
                          latitude: categories[index].latitude as double,
                          longitude: categories[index].longitude as double,
                          details:  categories[index].details,
                          images:  categories[index].detailImages as List<String>,
                          eventId: categories[index].id!,
                        )));
                      }, cats: categories[index]);
                    }
                ),
              ),
            ]
        ),
      ) : null,
    );
  }
}


class _TopRated extends ConsumerWidget {
  const _TopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);
    return SizedBox(
      child: categories.isNotEmpty ? SizedBox(
        height: getProportionateScreenHeight(500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 2//26
                ),
                child: Text(
                  'TOP RATED HANGOUT SPOTS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(19),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 24,),

            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // padding: const EdgeInsets.only(right: 20, left: 20),
                  physics: const ScrollPhysics(),
                  itemCount: categories.length,///BarModel.bars.
                  itemBuilder: (context, index){
                    return ListWidget(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
                        address:  categories[index].address,///BarModel.bars.
                        heading:  categories[index].label,
                        openTime:  categories[index].openTime,
                        latitude: categories[index].latitude as double,
                        longitude: categories[index].longitude as double,
                        entryFee:  categories[index].entryFee as List<String>,
                        details:  categories[index].details,
                        images:  categories[index].detailImages as List<String>,
                        eventId: categories[index].id!,
                      )));
                    }, cats: categories[index]);
                  }
              ),
            ),
          ],
        ),
      ) : null,
    );
  }
}

class _SmallStacked extends StatelessWidget {
  const _SmallStacked({Key? key, required this.onTap, required this.cats}) : super(key: key);

  final VoidCallback onTap;
  final CategoryModel cats;

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
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(cats.imageUrl,),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(///////////
              top: 125,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                  color: kGrey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    cats.label,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getFontSize(12)
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
